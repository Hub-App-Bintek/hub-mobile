import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart' as ur;
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/current_survey_schedule.dart';
import 'package:pkp_hub/data/models/installment.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/data/models/response/survey_response.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/finalize_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_active_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/approve_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/ask_contract_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/generate_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/request_payment_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/sign_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/files/download_file_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/approve_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/reject_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/upload_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/payment/approve_payment_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/approve_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/complete_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/create_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reject_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reschedule_survey_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final ApproveContractUseCase _approveContractUseCase;
  final AskContractRevisionUseCase _askContractRevisionUseCase;
  final GenerateContractDraftUseCase _generateContractDraftUseCase;
  final UploadFinalDocumentsUseCase _uploadFinalDocumentsUseCase;
  final ApproveFinalDocumentsUseCase _approveFinalDocumentsUseCase;
  final RejectFinalDocumentsUseCase _rejectFinalDocumentsUseCase;
  final DownloadFileUseCase _downloadFileUseCase;

  // New use case for signing contract
  final SignContractUseCase _signContractUseCase;
  final RequestPaymentUseCase _requestPaymentUseCase;
  final ApprovePaymentUseCase _approvePaymentUseCase;

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
    this._approveContractUseCase,
    this._askContractRevisionUseCase,
    this._generateContractDraftUseCase,
    this._uploadFinalDocumentsUseCase,
    this._approveFinalDocumentsUseCase,
    this._rejectFinalDocumentsUseCase,
    this._downloadFileUseCase,
    this._signContractUseCase,
    this._requestPaymentUseCase,
    this._approvePaymentUseCase,
  );

  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var error = Rxn<Failure>();
  var details = Rxn<ProjectDetailsResponse>();

  // Use RxList for robust reactivity with lists
  final RxList<ProjectHistory> consultationHistory = <ProjectHistory>[].obs;
  final userRole = Rxn<ur.UserRole>();
  String _paymentId = '';

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

  // Loading flags for contract approval by homeowner
  final RxBool contractApproveLoading = false.obs;
  final RxBool contractRejectLoading = false.obs;

  // Loading flag for signing contract
  final RxBool signContractLoading = false.obs;
  final RxBool requestPaymentLoading = false.obs;
  final RxBool approvePaymentLoading = false.obs;

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
    fetchDetails(isInitialLoad: true);
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

  Future<void> fetchDetails({bool isInitialLoad = false}) async {
    if (projectId.isEmpty) {
      error.value = const ServerFailure(message: 'Invalid project id');
      return;
    }

    // Prevent concurrent requests
    if (isLoading.value || isRefreshing.value) return;

    // Distinguish between initial load and refresh
    if (isInitialLoad) {
      isLoading.value = true;
      // Only clear data on initial load
      details.value = null;
      consultationHistory.clear();
    } else {
      isRefreshing.value = true;
    }

    error.value = null;

    await handleAsync<ProjectDetailsResponse>(
      () => _getDetailsUseCase(projectId),
      onSuccess: (data) {
        details.value = data;
        _handleConsultationHistory(data.consultation);
        isLoading.value = false;
        isRefreshing.value = false;
      },
      onFailure: (failure) {
        // Only set error on initial load, show snackbar on refresh
        if (isInitialLoad) {
          error.value = failure;
        }
        isLoading.value = false;
        isRefreshing.value = false;
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
                ? 'Jadwal Survey: ${Formatters.formatIsoDateTime(surveySchedule.proposedDateTime ?? '')}, WIB\n'
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
                ? 'Jadwal Survey: ${Formatters.formatIsoDateTime(surveySchedule.proposedDateTime ?? '')} WIB\n'
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
                ? 'Jadwal Survey: ${Formatters.formatIsoDateTime(surveySchedule.proposedDateTime ?? '')} WIB\n'
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
      } else if (project.step == 'CONTRACT' &&
          project.state == 'REQUEST_FOR_APPROVAL') {
        timeline.add(
          _buildProjectHistory(
            title: 'Dokumen kontrak telah tersedia',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'CONTRACT' &&
          project.state == 'REVISION_REQUESTED') {
        timeline.add(
          _buildProjectHistory(
            title: 'Pemilik lahan meminta revisi dokumen kontrak',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'CONTRACT' && project.state == 'APPROVED') {
        timeline.add(
          _buildProjectHistory(
            title:
                'Kontrak telah disetujui oleh pemilik lahan. Silakan tanda tangan dokumen kontrak.',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'CONTRACT' &&
          project.state == 'CONSULTANT_SIGNED') {
        timeline.add(
          _buildProjectHistory(
            title:
                'Kontrak telah ditandatangani oleh konsultan ${consultation.consultantName ?? ''}.',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'CONTRACT' && project.state == 'HOME_SIGNED') {
        timeline.add(
          _buildProjectHistory(
            title: 'Kontrak telah ditandatangani oleh pemilik lahan.',
            projectHistory: project,
          ),
        );
      } else if (project.step == 'CONTRACT' && project.state == 'SIGNED') {
        List<ProjectHistory> histories =
            details.value?.consultation?.consultationHistory ?? [];
        String lastSigner =
            histories.any((history) => history.state == 'CONSULTANT_SIGNED')
            ? 'pemilik lahan'
            : 'konsultan ${consultation.consultantName ?? ''}';
        String timelineText =
            'Kontrak telah ditandatangani oleh $lastSigner dan menunggu konsultan meminta proses pembayaran';
        timeline.add(
          _buildProjectHistory(title: timelineText, projectHistory: project),
        );
      } else if (project.step == 'PAYMENT' && project.state == 'REQUESTED') {
        _paymentId =
            details
                .value
                ?.consultation
                ?.consultationHistory
                ?.firstOrNull
                ?.metadata
                ?.paymentId ??
            '';
        String timelineText =
            'Konsultan ${consultation.consultantName ?? ''} meminta pembayaran sebesar ${Formatters.currency(project.metadata?.totalPaymentAmount ?? 0.0)}';
        timeline.add(
          _buildProjectHistory(title: timelineText, projectHistory: project),
        );
      } else if (project.step == 'CONSULTATION' && project.state == 'STARTED') {
        timeline.add(
          _buildProjectHistory(
            title:
                'Pemilik lahan telah melakukan pembayaran. Konsultan ${consultation.consultantName ?? ''} akan menyiapkan dokumen yang diperlukan.',
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

    try {
      await handleAsync<Consultation>(
        () => _acceptConsultationUseCase(consultationId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Permintaan konsultasi diterima',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      acceptConsultationLoading.value = false;
    }
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

    try {
      await handleAsync<Consultation>(
        () => _rejectConsultationUseCase(consultationId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Permintaan konsultasi berhasil ditolak',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      rejectConsultationLoading.value = false;
    }
  }

  // Handle submission from SurveyScheduleBottomSheet
  Future<void> submitSurveySchedule(CreateSurveyScheduleRequest request) async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    await handleAsync<SurveyResponse>(
      () => _createSurveyScheduleUseCase(
        CreateSurveyScheduleParams(
          consultationId: consultationId,
          request: request,
        ),
      ),
      onSuccess: (_) {
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Jadwal survey berhasil dibuat',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successDark,
          colorText: AppColors.white,
        );
        fetchDetails();
      },
      onFailure: (failure) => showError(failure),
    );
  }

  // Handle reschedule submission by consultant when last schedule is REJECTED
  Future<void> submitRescheduleSurvey(
    CreateSurveyScheduleRequest request,
  ) async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    await handleAsync<SurveySchedule>(
      () => _rescheduleSurveyUseCase(
        RescheduleSurveyParams(
          consultationId: consultationId,
          request: request,
        ),
      ),
      onSuccess: (_) {
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Jadwal survey berhasil diajukan ulang',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successDark,
          colorText: AppColors.white,
        );
        fetchDetails();
      },
      onFailure: (failure) => showError(failure),
    );
  }

  // Approve schedule by homeowner
  Future<void> approveSurveySchedule() async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    // Prevent concurrent actions
    if (approveLoading.value || rejectLoading.value) return;

    approveLoading.value = true;
    try {
      await handleAsync<SurveySchedule>(
        () => _approveSurveyScheduleUseCase(consultationId),
        onSuccess: (_) {
          Get.snackbar(
            'Sukses',
            'Jadwal survey disetujui',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      approveLoading.value = false;
    }
  }

  // Reject schedule by homeowner
  Future<void> rejectSurveySchedule({String? notes}) async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    // Prevent concurrent actions
    if (rejectLoading.value || approveLoading.value) return;

    rejectLoading.value = true;
    try {
      await handleAsync<SurveySchedule>(
        () => _rejectSurveyScheduleUseCase(
          RejectSurveyScheduleParams(
            consultationId: consultationId,
            notes: notes,
          ),
        ),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Jadwal survey berhasil ditolak',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (f) => showError(f),
      );
    } finally {
      rejectLoading.value = false;
    }
  }

  // Mark survey as completed by consultant
  Future<void> completeSurvey() async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }
    if (completeSurveyLoading.value) return;
    completeSurveyLoading.value = true;

    try {
      await handleAsync<void>(
        () => _completeSurveyUseCase(consultationId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Survey telah selesai dilakukan',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      completeSurveyLoading.value = false;
    }
  }

  // Download contract template (open the template file URL)
  Future<void> downloadContractTemplate() async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return;
    }

    if (downloadTemplateLoading.value) return;
    downloadTemplateLoading.value = true;

    try {
      await handleAsync<Contract>(
        () => _getContractUseCase(consultationId),
        onSuccess: (contract) {
          final url = (contract.fileUrl?.isNotEmpty == true)
              ? contract.fileUrl
              : contract.pdfUrl; // fallback
          if (url == null || url.isEmpty) {
            showError(
              const ServerFailure(message: 'Dokumen kontrak tidak tersedia'),
            );
            return;
          }
          final uri = Uri.tryParse(url);
          if (uri == null) {
            showError(
              const ServerFailure(message: 'URL dokumen kontrak tidak valid'),
            );
            return;
          }
          launchUrl(uri, mode: LaunchMode.externalApplication)
              .then((ok) {
                if (!ok) {
                  showError(
                    const ServerFailure(
                      message: 'Gagal membuka dokumen kontrak',
                    ),
                  );
                }
              })
              .catchError((_) {
                showError(
                  const ServerFailure(
                    message: 'Terjadi kesalahan saat membuka dokumen',
                  ),
                );
              });
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      downloadTemplateLoading.value = false;
    }
  }

  // Upload a provided contract file (used by bottom sheet). Returns true on success
  Future<bool> uploadContract(
    File file,
    double contractValue,
    List<Installment> installments,
  ) async {
    final consultationId = details.value?.consultation?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return false;
    }

    uploadContractLoading.value = true;
    bool done = false;
    try {
      await handleAsync<UploadContractResponse>(
        () => _uploadContractUseCase(
          UploadContractParam(
            consultationId: consultationId,
            file: file,
            generateContractRequest: GenerateContractDraftRequest(
              contractValue: contractValue,
            ),
          ),
        ),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Dokumen kontrak berhasil disubmit',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
          done = true;
        },
        onFailure: (failure) {
          showError(failure);
          done = false;
        },
      );
    } finally {
      uploadContractLoading.value = false;
    }

    return done;
  }

  Future<bool> generateAndDownloadContractTemplate({
    required double contractValue,
    // required List<Installment> installments,
  }) async {
    final cId = details.value?.consultation?.consultationId;
    if (cId == null || cId.isEmpty) {
      showError(const ServerFailure(message: 'Consultation ID not found'));
      return false;
    }

    if (downloadTemplateLoading.value) return false;
    downloadTemplateLoading.value = true;
    // Show progress while generating/downloading (immediately to avoid missing fast ops)
    showLoadingOverlay(message: 'Mengunduh dokumen...', delay: Duration.zero);

    bool done = false;
    try {
      final req = GenerateContractDraftRequest(contractValue: contractValue);
      await handleAsync<DownloadedFile>(
        () => _generateContractDraftUseCase(
          GenerateContractDraftParams(consultationId: cId, request: req),
        ),
        onSuccess: (file) async {
          // Hide overlay before showing any native save dialogs (esp. iOS)
          hideLoadingOverlay();

          final projectName = details.value?.name ?? 'Untitled';

          // Prefer public Documents on Android; iOS will show a system Save dialog
          final saved = await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: file.bytes,
          );

          if (saved != null && saved.isNotEmpty) {
            final where = Platform.isAndroid
                ? 'Dokumen > PKP > $projectName'
                : 'Files app (lokasi yang Anda pilih)';
            Get.snackbar(
              'Berhasil',
              'Template disimpan di: $where',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.successDark,
              colorText: AppColors.white,
            );
          } else {
            Get.snackbar(
              'Dibatalkan',
              'Penyimpanan file dibatalkan.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.errorDark,
              colorText: AppColors.white,
            );
          }

          done = true;
        },
        onFailure: (failure) {
          hideLoadingOverlay();
          showError(failure);
          done = false;
        },
      );
    } finally {
      // Ensure overlay is closed in case of early returns
      hideLoadingOverlay();
      downloadTemplateLoading.value = false;
    }

    return done;
  }

  Future<bool> downloadFileById(String? fileId) async {
    if (fileId == null || fileId.isEmpty) {
      showError(const ServerFailure(message: 'File ID not found'));
      return false;
    }

    if (downloadTemplateLoading.value) return false;
    downloadTemplateLoading.value = true;
    // Show progress overlay during file download (immediately)
    showLoadingOverlay(message: 'Mengunduh file...', delay: Duration.zero);

    bool done = false;
    try {
      await handleAsync<DownloadedFile>(
        () => _downloadFileUseCase(DownloadFileParams(fileId: fileId)),
        onSuccess: (file) async {
          // Hide overlay before potential native save dialogs
          hideLoadingOverlay();

          final projectName = details.value?.name ?? 'Untitled';

          final saved = await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: file.bytes,
          );

          if (saved != null && saved.isNotEmpty) {
            final where = Platform.isAndroid
                ? 'Dokumen > PKP > $projectName'
                : 'Files app (lokasi yang Anda pilih)';
            Get.snackbar(
              'Berhasil',
              'File disimpan di: $where',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.successDark,
              colorText: AppColors.white,
            );
            done = true;
          } else {
            Get.snackbar(
              'Gagal',
              'File gagal didownload.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.errorDark,
              colorText: AppColors.white,
            );
            done = false;
          }
        },
        onFailure: (failure) {
          hideLoadingOverlay();
          showError(failure);
          done = false;
        },
      );
    } finally {
      // Ensure overlay is closed
      hideLoadingOverlay();
      downloadTemplateLoading.value = false;
    }

    return done;
  }

  Future<void> approveContract() async {
    String contractId = '';
    for (final history in consultationHistory.reversed) {
      if (history.step?.toUpperCase() == 'CONTRACT' &&
          history.metadata?.contractId?.isNotEmpty == true) {
        contractId = history.metadata?.contractId ?? '';
        break;
      }
    }
    if (contractId.isEmpty) {
      showError(const ServerFailure(message: 'Contract ID not found'));
      return;
    }
    if (contractApproveLoading.value || contractRejectLoading.value) return;
    contractApproveLoading.value = true;

    try {
      await handleAsync<void>(
        () => _approveContractUseCase(contractId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Kontrak disetujui',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      contractApproveLoading.value = false;
    }
  }

  Future<void> rejectContract() async {
    String contractId = '';
    for (final history in consultationHistory.reversed) {
      if (history.step?.toUpperCase() == 'CONTRACT' &&
          history.metadata?.contractId?.isNotEmpty == true) {
        contractId = history.metadata?.contractId ?? '';
        break;
      }
    }
    if (contractId.isEmpty) {
      showError(const ServerFailure(message: 'Contract ID not found'));
      return;
    }
    if (contractRejectLoading.value || contractApproveLoading.value) return;
    contractRejectLoading.value = true;

    try {
      await handleAsync<void>(
        () => _askContractRevisionUseCase(
          AskContractRevisionParams(
            contractId: contractId,
            // TODO: Update this using user input from a bottom sheet
            revisionNotes: 'Ini tidak benar',
          ),
        ),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Berhasil meminta revisi kontrak',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      contractRejectLoading.value = false;
    }
  }

  Future<void> signContract() async {
    // Find latest contractId from history metadata
    String contractId = '';
    for (final history in consultationHistory.reversed) {
      if (history.step?.toUpperCase() == 'CONTRACT' &&
          history.metadata?.contractId?.isNotEmpty == true) {
        contractId = history.metadata?.contractId ?? '';
        break;
      }
    }
    if (contractId.isEmpty) {
      showError(const ServerFailure(message: 'Contract ID not found'));
      return;
    }
    if (signContractLoading.value) return;
    signContractLoading.value = true;

    try {
      await handleAsync<Contract>(
        () => _signContractUseCase(contractId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Kontrak berhasil ditandatangani',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      signContractLoading.value = false;
    }
  }

  Future<void> requestPayment() async {
    // Find latest contractId from history metadata
    String contractId = '';
    for (final history in consultationHistory.reversed) {
      if (history.step?.toUpperCase() == 'CONTRACT' &&
          history.metadata?.contractId?.isNotEmpty == true) {
        contractId = history.metadata?.contractId ?? '';
        break;
      }
    }
    if (contractId.isEmpty) {
      showError(const ServerFailure(message: 'Contract ID not found'));
      return;
    }

    if (requestPaymentLoading.value) return;
    requestPaymentLoading.value = true;

    try {
      await handleAsync<Contract>(
        () => _requestPaymentUseCase(contractId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Permintaan pembayaran telah dikirim',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      requestPaymentLoading.value = false;
    }
  }

  Future<void> approvePayment() async {
    if (_paymentId.isEmpty) {
      showError(const ServerFailure(message: 'Payment ID not found'));
      return;
    }

    if (approvePaymentLoading.value) return;
    approvePaymentLoading.value = true;
    final balance = await _userStorage.getBalance() ?? 0.0;
    final requiredAmount =
        consultationHistory.firstOrNull?.metadata?.totalPaymentAmount ?? 0.0;
    if (requiredAmount > balance) {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Saldo di wallet tidak mencukupi',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
      approvePaymentLoading.value = false;
      return;
    }

    try {
      await handleAsync<Payment>(
        () => _approvePaymentUseCase(_paymentId),
        onSuccess: (_) {
          Get.snackbar(
            'Berhasil',
            'Pembayaran berhasil disetujui dan ditahan di escrow',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          fetchDetails();
        },
        onFailure: (failure) => showError(failure),
      );
    } finally {
      approvePaymentLoading.value = false;
    }
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

  /// Visibility rules for bottomNavigationBar button
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

  /// Returns the latest survey schedule by updatedAt/createdAt
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

  /// Visibility rules for reschedule when latest proposed schedule was rejected
  bool get shouldShowRescheduleButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final lastStatus = latestSurveySchedule?.status?.toUpperCase();
    return isConsultant && lastStatus == 'REJECTED';
  }

  /// Visibility rules for homeowner approval actions
  bool get shouldShowSurveyScheduleApprovalButtons {
    final isHomeowner = userRole.value == ur.UserRole.homeowner;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isHomeowner && status == 'MENUNGGU_APPROVAL_JADWAL';
  }

  /// Visibility rule for consultant to mark survey as done
  bool get shouldShowCompleteSurveyButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'SURVEY_DIJADWALKAN';
  }

  /// Visibility rules for consultant contract actions (download & upload)
  bool get shouldShowContractActions {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant &&
        (status == 'SURVEY_SELESAI' || status == 'MENYIAPKAN_KONTRAK');
  }

  /// Visibility rule for consultant to upload documents when consultation is active
  /// Show when user is consultant, consultation.status == 'AKTIF', and
  /// the first consultation history item (from the detail response order)
  /// has state == 'STARTED'.
  bool get shouldShowUploadDocumentsButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    if (!isConsultant || status != 'AKTIF') return false;

    final histories = details.value?.consultation?.consultationHistory;
    if (histories == null || histories.isEmpty) return false;

    final firstState = histories.first.state?.toUpperCase();
    return firstState == 'STARTED';
  }

  /// Visibility rules for homeowner to approve or reject contract
  bool get shouldShowContractApprovalButtons {
    final isHomeowner = userRole.value == ur.UserRole.homeowner;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isHomeowner && status == 'MENUNGGU_APPROVAL_KONTRAK';
  }

  /// Visibility rule for "Tanda Tangan Kontrak" button
  /// Shows when status is MENUNGGU_TANDA_TANGAN_KONTRAK with additional role-based rules:
  /// - If state is CONSULTANT_SIGNED => show only for homeowner
  /// - If state is HOMEOWNER_SIGNED => show only for consultant
  bool get shouldShowSignContractButton {
    final status = details.value?.consultation?.status?.toUpperCase();
    if (status != 'MENUNGGU_TANDA_TANGAN_KONTRAK') return false;

    final role = userRole.value;
    if (role == ur.UserRole.consultant) {
      return !consultationHistory.any(
        (history) => history.state == 'CONSULTANT_SIGNED',
      );
    } else if (role == ur.UserRole.homeowner) {
      return !consultationHistory.any(
        (history) => history.state == 'HOMEOWNER_SIGNED',
      );
    }

    return role == ur.UserRole.homeowner || role == ur.UserRole.consultant;
  }

  /// Visibility rule for showing "Request Payment" action
  /// Shown when consultation status is MENUNGGU_REQUEST_PAYMENT and user is consultant
  bool get shouldShowRequestPaymentButton {
    final isConsultant = userRole.value == ur.UserRole.consultant;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isConsultant && status == 'MENUNGGU_REQUEST_PAYMENT';
  }

  /// Visibility rule for homeowner payment actions
  /// Shows when consultation status is MENUNGGU_PEMBAYARAN and user is homeowner
  bool get shouldShowPaymentButtons {
    final isHomeowner = userRole.value == ur.UserRole.homeowner;
    final status = details.value?.consultation?.status?.toUpperCase();
    return isHomeowner && status == 'MENUNGGU_PEMBAYARAN';
  }
}
