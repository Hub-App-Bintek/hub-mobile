import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart' as ur;
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/current_survey_schedule.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/data/models/response/survey_response.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/finalize_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_active_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/reject_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/sign_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/approve_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/reject_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/upload_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/approve_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/complete_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/create_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reject_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reschedule_survey_use_case.dart';

class ProjectDetailsController extends BaseController {
  final GetProjectDetailsUseCase _getDetailsUseCase;
  final UserStorage _userStorage;
  final String projectId;

  // Consultation use cases
  final AcceptConsultationUseCase _acceptConsultationUseCase;
  final RejectConsultationUseCase _rejectConsultationUseCase;
  final StartActiveConsultationUseCase _startActiveConsultationUseCase;
  final StartRevisionUseCase _startRevisionUseCase;
  final FinalizeConsultationUseCase _finalizeConsultationUseCase;
  final CreateSurveyScheduleUseCase _createSurveyScheduleUseCase;
  final ApproveSurveyScheduleUseCase _approveSurveyScheduleUseCase;
  final RejectSurveyScheduleUseCase _rejectSurveyScheduleUseCase;
  final RescheduleSurveyUseCase _rescheduleSurveyUseCase;
  final CompleteSurveyUseCase _completeSurveyUseCase;
  final UploadContractUseCase _uploadContractUseCase;
  final GetContractUseCase _getContractUseCase;
  final SignContractUseCase _signContractUseCase;
  final RejectContractUseCase _rejectContractUseCase;
  final UploadFinalDocumentsUseCase _uploadFinalDocumentsUseCase;
  final ApproveFinalDocumentsUseCase _approveFinalDocumentsUseCase;
  final RejectFinalDocumentsUseCase _rejectFinalDocumentsUseCase;

  ProjectDetailsController(
    this.projectId,
    this._getDetailsUseCase,
    this._userStorage,
    this._acceptConsultationUseCase,
    this._rejectConsultationUseCase,
    this._startActiveConsultationUseCase,
    this._startRevisionUseCase,
    this._finalizeConsultationUseCase,
    this._createSurveyScheduleUseCase,
    this._approveSurveyScheduleUseCase,
    this._rejectSurveyScheduleUseCase,
    this._rescheduleSurveyUseCase,
    this._completeSurveyUseCase,
    this._uploadContractUseCase,
    this._getContractUseCase,
    this._signContractUseCase,
    this._rejectContractUseCase,
    this._uploadFinalDocumentsUseCase,
    this._approveFinalDocumentsUseCase,
    this._rejectFinalDocumentsUseCase,
  );

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var details = Rxn<ProjectDetailsResponse>();

  // Use RxList for robust reactivity with lists
  final RxList<ProjectHistory> consultationHistory = <ProjectHistory>[].obs;
  final userRole = Rxn<ur.UserRole>();

  // Loading flags for homeowner actions
  final RxBool approveLoading = false.obs;
  final RxBool rejectLoading = false.obs;

  // Loading flags for consultant confirmation actions
  final RxBool acceptConsultationLoading = false.obs;
  final RxBool rejectConsultationLoading = false.obs;

  // Loading flag for consultant marking survey as done
  final RxBool completeSurveyLoading = false.obs;

  // Loading flags for contract actions
  final RxBool downloadTemplateLoading = false.obs;
  final RxBool uploadContractLoading = false.obs;

  // Scroll controller for timeline list
  final ScrollController timelineScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    if (projectId.isEmpty) {
      error.value = const ServerFailure(message: 'Invalid project id');
      return;
    }
    _initUserRole();
    fetchDetails();
  }

  @override
  void onClose() {
    timelineScrollController.dispose();
    super.onClose();
  }

  Future<void> _initUserRole() async {
    final user = await _userStorage.getUser();
    userRole.value = ur.userRoleFromString(user?.role);
  }

  Future<void> fetchDetails() async {
    if (projectId.isEmpty) {
      error.value = const ServerFailure(message: 'Invalid project id');
      return;
    }
    if (isLoading.value) return;
    isLoading.value = true;
    error.value = null;

    details.value = null;
    consultationHistory.clear();

    await handleAsync<ProjectDetailsResponse>(
      () => _getDetailsUseCase(projectId),
      onSuccess: (data) {
        details.value = data;
        _handleConsultationHistory(data.consultation);
        isLoading.value = false;
      },
      onFailure: (failure) {
        error.value = failure;
        isLoading.value = false;
        showError(failure);
      },
    );
  }

  Future<void> _handleConsultationHistory(Consultation? consultation) async {
    if (consultation == null) {
      consultationHistory.clear();
      return;
    }

    final List<ProjectHistory> timeline = [];
    timeline.add(
      _buildProjectHistory(
        title:
            'Menunggu konsultan ${consultation.consultantName ?? ''} untuk menerima permintaan konsultasi',
      ),
    );

    consultation.consultationHistory?.reversed.forEach((project) {
      if (project.step == 'CONSULTATION' && project.state == 'ACCEPTED') {
        timeline.add(
          _buildProjectHistory(
            title:
                'Konsultan ${consultation.consultantName ?? ''} telah menerima permintaan konsultasi dan akan mengajukan jadwal survey',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'SURVEY' && project.state == 'SCHEDULED') {
        CurrentSurveySchedule? surveySchedule = consultation.surveySchedules
            ?.firstWhereOrNull(
              (schedule) => schedule.scheduleId == project.metadata?.scheduleId,
            );

        timeline.add(
          _buildProjectHistory(
            title: 'Konsultan telah mengajukan jadwal survey lokasi',
            subtitle: (surveySchedule != null)
                ? 'Tanggal: ${Formatters.formatIsoDate(surveySchedule.proposedDateTime ?? '')}\n'
                      'Waktu: ${Formatters.formatIsoTime(surveySchedule.proposedDateTime ?? '')} WIB\n'
                      'Biaya: ${Formatters.currency(surveySchedule.surveyCost ?? 0.0)}'
                : '',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'SURVEY' && project.state == 'REJECTED') {
        CurrentSurveySchedule? surveySchedule = consultation.surveySchedules
            ?.firstWhereOrNull(
              (schedule) => schedule.scheduleId == project.metadata?.scheduleId,
            );

        timeline.add(
          _buildProjectHistory(
            title: 'Pemilik lahan menolak jadwal survey yang diajukan',
            subtitle: (surveySchedule != null)
                ? 'Tanggal: ${Formatters.formatIsoDate(surveySchedule.proposedDateTime ?? '')}\n'
                      'Waktu: ${Formatters.formatIsoTime(surveySchedule.proposedDateTime ?? '')} WIB\n'
                      'Biaya: ${Formatters.currency(surveySchedule.surveyCost ?? 0.0)}'
                : '',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'SURVEY' && project.state == 'RESCHEDULED') {
        CurrentSurveySchedule? surveySchedule = consultation.surveySchedules
            ?.firstWhereOrNull(
              (schedule) => schedule.scheduleId == project.metadata?.scheduleId,
            );

        timeline.add(
          _buildProjectHistory(
            title: 'Konsultan telah mengajukan ulang jadwal survey lokasi',
            subtitle: (surveySchedule != null)
                ? 'Tanggal: ${Formatters.formatIsoDate(surveySchedule.proposedDateTime ?? '')}\n'
                      'Waktu: ${Formatters.formatIsoTime(surveySchedule.proposedDateTime ?? '')} WIB\n'
                      'Biaya: ${Formatters.currency(surveySchedule.surveyCost ?? 0.0)}'
                : '',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'SURVEY' && project.state == 'APPROVED') {
        timeline.add(
          _buildProjectHistory(
            title: 'Jadwal survey telah disetujui',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'SURVEY' && project.state == 'COMPLETED') {
        timeline.add(
          _buildProjectHistory(
            title:
                'Konsultan telah menyelesaikan survey lokasi dan sedang menyiapkan dokumen kontrak',
            projectHistory: project,
          ),
        );
      }
    });

    consultationHistory.assignAll(timeline);
    _scrollTimelineToBottom();
  }

  void _scrollTimelineToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!timelineScrollController.hasClients) return;
      final position = timelineScrollController.position;
      final target = position.maxScrollExtent;
      // jumpTo is fine; use animateTo for smoother UX if desired
      if (target > 0) {
        timelineScrollController.jumpTo(target);
      }
    });
  }

  Future<void> acceptConsultation() async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    if (acceptConsultationLoading.value || rejectConsultationLoading.value) {
      return;
    }
    acceptConsultationLoading.value = true;

    await handleAsync<Consultation>(
      () => _acceptConsultationUseCase(consultationId),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Permintaan konsultasi diterima');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );

    acceptConsultationLoading.value = false;
  }

  Future<void> rejectConsultation() async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    if (rejectConsultationLoading.value || acceptConsultationLoading.value) {
      return;
    }
    rejectConsultationLoading.value = true;

    await handleAsync<Consultation>(
      () => _rejectConsultationUseCase(consultationId),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Permintaan konsultasi ditolak');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );

    rejectConsultationLoading.value = false;
  }

  // Handle submission from SurveyScheduleBottomSheet
  Future<void> submitSurveySchedule(CreateSurveyScheduleRequest request) async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    await handleAsync<SurveyResponse>(
      () => _createSurveyScheduleUseCase(
        CreateSurveyScheduleParams(consultationId: cId, request: request),
      ),
      onSuccess: (_) {
        Get.back();
        Get.snackbar('Sukses', 'Jadwal survey berhasil dibuat');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );
  }

  // Handle reschedule submission by consultant when last schedule is REJECTED
  Future<void> submitRescheduleSurvey(
    CreateSurveyScheduleRequest request,
  ) async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    await handleAsync<SurveySchedule>(
      () => _rescheduleSurveyUseCase(
        RescheduleSurveyParams(consultationId: cId, request: request),
      ),
      onSuccess: (_) {
        Get.back();
        Get.snackbar('Sukses', 'Jadwal survey berhasil diajukan ulang');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );
  }

  // Approve schedule by homeowner
  Future<void> approveSurveySchedule() async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    // Prevent concurrent actions
    if (approveLoading.value || rejectLoading.value) return;
    approveLoading.value = true;
    await handleAsync<SurveySchedule>(
      () => _approveSurveyScheduleUseCase(cId),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Jadwal survey disetujui');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );
    approveLoading.value = false;
  }

  // Reject schedule by homeowner
  Future<void> rejectSurveySchedule({String? notes}) async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    // Prevent concurrent actions
    if (rejectLoading.value || approveLoading.value) return;
    rejectLoading.value = true;
    await handleAsync<SurveySchedule>(
      () => _rejectSurveyScheduleUseCase(
        RejectSurveyScheduleParams(consultationId: cId, notes: notes),
      ),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Jadwal survey ditolak');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );
    rejectLoading.value = false;
  }

  // Mark survey as completed by consultant
  Future<void> completeSurvey() async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    if (completeSurveyLoading.value) return;
    completeSurveyLoading.value = true;

    await handleAsync<void>(
      () => _completeSurveyUseCase(cId),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Survey telah selesai');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );

    completeSurveyLoading.value = false;
  }

  // Download contract template (open the template PDF URL)
  Future<void> downloadContractTemplate() async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    if (downloadTemplateLoading.value) return;
    downloadTemplateLoading.value = true;
    // TODO: Download contract document template file
    downloadTemplateLoading.value = false;
  }

  // Upload signed contract document (PDF)
  Future<void> uploadContract() async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    // Pick PDF file
    final picked = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (picked == null || picked.files.isEmpty) {
      // User cancelled
      return;
    }

    final path = picked.files.single.path;
    if (path == null || path.isEmpty) {
      showError(const ServerFailure(message: 'File tidak valid'));
      return;
    }

    if (uploadContractLoading.value) return;
    uploadContractLoading.value = true;

    await handleAsync<Contract>(
      () => _uploadContractUseCase(
        UploadContractParams(consultationId: cId, file: File(path)),
      ),
      onSuccess: (_) {
        Get.snackbar('Sukses', 'Dokumen kontrak berhasil diunggah');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );

    uploadContractLoading.value = false;
  }

  // Upload a provided contract file (used by bottom sheet). Returns true on success
  Future<bool> uploadContractFile(File file) async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return false;
    }
    if (uploadContractLoading.value) return false;
    uploadContractLoading.value = true;

    var ok = false;
    await handleAsync<Contract>(
      () => _uploadContractUseCase(
        UploadContractParams(consultationId: cId, file: file),
      ),
      onSuccess: (_) {
        ok = true;
        Get.snackbar('Sukses', 'Dokumen kontrak berhasil diunggah');
        fetchDetails();
      },
      onFailure: (f) => showError(f),
    );

    uploadContractLoading.value = false;
    return ok;
  }

  ProjectHistory _buildProjectHistory({
    required String title,
    String? subtitle,
    ProjectHistory? projectHistory,
  }) {
    return ProjectHistory(
      title: title,
      subtitle: subtitle,
      step: projectHistory?.step,
      state: projectHistory?.state,
      files: projectHistory?.files,
      attachments: projectHistory?.attachments,
      metadata: projectHistory?.metadata,
    );
  }

  // Visibility rules for bottomNavigationBar button
  bool get shouldShowConsultationConfirmationButtons {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'MENUNGGU_KONFIRMASI_KONSULTAN';
  }

  bool get shouldShowScheduleButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'MENUNGGU_JADWAL_SURVEY';
  }

  // Returns the latest survey schedule by updatedAt/createdAt
  CurrentSurveySchedule? get latestSurveySchedule {
    final schedules = details.value?.consultation?.surveySchedules;
    if (schedules == null || schedules.isEmpty) return null;
    final sorted = [...schedules];
    int safeCompare(CurrentSurveySchedule a, CurrentSurveySchedule b) {
      DateTime parseSafe(CurrentSurveySchedule s) {
        final ts = s.updatedAt?.isNotEmpty == true
            ? s.updatedAt!
            : (s.createdAt ?? '');
        return DateTime.tryParse(ts) ?? DateTime.fromMillisecondsSinceEpoch(0);
      }

      final ad = parseSafe(a);
      final bd = parseSafe(b);
      return ad.compareTo(bd);
    }

    sorted.sort(safeCompare);
    return sorted.last;
  }

  // Visibility rules for reschedule when latest proposed schedule was rejected
  bool get shouldShowRescheduleButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final lastStatus = latestSurveySchedule?.status?.toUpperCase();
    return isConsultant && lastStatus == 'REJECTED';
  }

  // Visibility rules for homeowner approval actions
  bool get shouldShowSurveyScheduleApprovalButtons {
    final isHomeowner = userRole.value == ur.UserRole.homeowner;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isHomeowner && status == 'MENUNGGU_APPROVAL_JADWAL';
  }

  // Visibility rule for consultant to mark survey as done
  bool get shouldShowCompleteSurveyButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'SURVEY_DIJADWALKAN';
  }

  // Visibility rules for consultant contract actions (download & upload)
  bool get shouldShowContractActions {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'SURVEY_SELESAI';
  }
}
