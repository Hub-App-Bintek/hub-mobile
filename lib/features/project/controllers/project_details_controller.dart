import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/consultation_status.dart' as cs;
import 'package:pkp_hub/core/enums/user_role.dart' as ur;
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/entity/user.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_active_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/finalize_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/create_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/approve_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reject_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reschedule_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/complete_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/upload_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/approve_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/reject_final_documents_use_case.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/features/project/widgets/schedule_survey_sheet.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

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
    this._uploadFinalDocumentsUseCase,
    this._approveFinalDocumentsUseCase,
    this._rejectFinalDocumentsUseCase,
  );

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var details = Rxn<ProjectDetailsResponse>();
  var consultationHistory = Rxn<List<ProjectHistory>>();
  final userRole = Rxn<ur.UserRole>();

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

  Future<void> _initUserRole() async {
    final user = await _userStorage.getUser();
    userRole.value = ur.userRoleFromString(user?.role);
  }

  cs.ConsultationStatus get _status =>
      cs.consultationStatusFromString(details.value?.consultation?.status);

  bool get canConsultantSetSurveySchedule =>
      userRole.value == ur.UserRole.consultant &&
      _status == cs.ConsultationStatus.waitingForSurveySchedule;
  bool get canConsultantCompleteSurvey =>
      userRole.value == ur.UserRole.consultant &&
      _status == cs.ConsultationStatus.surveyScheduled;
  bool get canHomeownerScheduleApproval =>
      userRole.value == ur.UserRole.homeowner &&
      _status == cs.ConsultationStatus.waitingForScheduleApproval;
  bool get canConsultantUploadFinalDocs {
    if (userRole.value != ur.UserRole.consultant ||
        _status != cs.ConsultationStatus.finalStatus)
      return false;
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    return !hasAnyDocs;
  }

  bool get canHomeownerApproveFinalDocs {
    if (userRole.value != ur.UserRole.homeowner ||
        _status != cs.ConsultationStatus.finalStatus)
      return false;
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    final hasPermit = (details.value?.consultation?.permit ?? '')
        .trim()
        .isNotEmpty;
    return hasAnyDocs && !hasPermit;
  }

  bool get canConsultantFinalizeConsultation {
    if (userRole.value != ur.UserRole.consultant ||
        _status != cs.ConsultationStatus.finalStatus)
      return false;
    final hasPermit = (details.value?.consultation?.permit ?? '')
        .trim()
        .isNotEmpty;
    return hasPermit;
  }

  Future<void> fetchDetails() async {
    if (projectId.isEmpty) {
      error.value = const ServerFailure(message: 'Invalid project id');
      return;
    }
    if (isLoading.value) return;
    isLoading.value = true;
    error.value = null;
    await handleAsync<ProjectDetailsResponse>(
      () => _getDetailsUseCase(projectId),
      onSuccess: (data) {
        details.value = data;
        _rebuildConsultationHistory(data.consultation);
        isLoading.value = false;
      },
      onFailure: (failure) {
        error.value = failure;
        isLoading.value = false;
        showError(failure);
      },
    );
  }

  void _rebuildConsultationHistory(Consultation? consultation) {
    final List<ProjectHistory> history = [
      ...?consultation?.consultationHistory,
    ];
    final status = cs.consultationStatusFromString(consultation?.status);
    if (status == cs.ConsultationStatus.waitingForConfirmation) {
      // Build dynamic message including consultant name if available
      final consultant = (consultation?.consultantName ?? '').trim();
      final title = consultant.isNotEmpty
          ? 'Menunggu konfirmasi konsultasi oleh $consultant'
          : 'Menunggu konfirmasi konsultasi';
      history.add(ProjectHistory(title: title));
    } else if (status == cs.ConsultationStatus.waitingForSurveySchedule) {
      // New history card when waiting for survey schedule
      final consultant = (consultation?.consultantName ?? '').trim();
      final namePart = consultant.isNotEmpty ? ' $consultant' : '';
      final title =
          'Konsultan $namePart telah menerima permintaan konsultasi dan sedang mengajukan jadwal untuk survey';
      history.add(ProjectHistory(title: title));
    } else if (status == cs.ConsultationStatus.waitingForScheduleApproval) {
      // New card: consultant has proposed a survey schedule, awaiting homeowner approval
      final consultant = (consultation?.consultantName ?? '').trim();
      final title = consultant.isNotEmpty
          ? 'Konsultan $consultant telah mengajukan jadwal untuk survey ke lokasi'
          : 'Konsultan telah mengajukan jadwal untuk survey ke lokasi';
      final schedule = consultation?.currentSurveySchedule;
      String? subtitle;
      if (schedule != null) {
        final lines = <String>[];
        final dtRaw = schedule.proposedDateTime;
        if (dtRaw != null && dtRaw.trim().isNotEmpty) {
          DateTime? dt;
          try {
            dt = DateTime.parse(dtRaw);
          } catch (_) {}
          if (dt != null) {
            final dateStr = DateFormat('dd MMM yyyy', 'id_ID').format(dt);
            final timeStr = DateFormat('HH.mm', 'id_ID').format(dt);
            lines.add('Tanggal : $dateStr');
            lines.add('Waktu : $timeStr WIB');
          }
        }
        final cost = schedule.surveyCost;
        if (cost != null) {
          final currency = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp',
            decimalDigits: 0,
          ).format(cost);
          lines.add('Biaya : $currency');
        }
        if (lines.isNotEmpty) subtitle = lines.join('\n');
      }
      history.add(ProjectHistory(title: title, subtitle: subtitle));
    } else if (status == cs.ConsultationStatus.surveyScheduled) {
      // Schedule approved and locked in
      const title = 'Jadwal survey telah disetujui';
      String? subtitle;
      // Prefer the final scheduledAt, fallback to proposedDateTime
      final raw = (consultation?.scheduledAt ?? '').trim().isNotEmpty
          ? consultation?.scheduledAt
          : consultation?.currentSurveySchedule?.proposedDateTime;
      if (raw != null && raw.trim().isNotEmpty) {
        DateTime? dt;
        try {
          dt = DateTime.parse(raw);
        } catch (_) {}
        if (dt != null) {
          final dateStr = DateFormat('dd MMM yyyy', 'id_ID').format(dt);
          final timeStr = DateFormat('HH.mm', 'id_ID').format(dt);
          final lines = <String>['Tanggal : $dateStr', 'Waktu : $timeStr WIB'];
          final cost = consultation?.currentSurveySchedule?.surveyCost;
          if (cost != null) {
            final currency = NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(cost);
            lines.add('Biaya : $currency');
          }
          subtitle = lines.join('\n');
        }
      }
      history.add(ProjectHistory(title: title, subtitle: subtitle));
    } else if (status == cs.ConsultationStatus.doneSurvey) {
      // Survey completed, contract being prepared/uploaded
      final consultant = (consultation?.consultantName ?? '').trim();
      final namePart = consultant.isNotEmpty ? ' $consultant' : '';
      final title =
          'Konsultan$namePart telah menyelesaikan survey dan sedang menyiapkan dokumen kontrak';
      history.add(ProjectHistory(title: title));
    } else if (status == cs.ConsultationStatus.needRevision) {
      // Contract approval stage (or revision requested)
      final hasRevision = (consultation?.revisionRequests?.isNotEmpty ?? false);
      final title = hasRevision
          ? 'Kontrak memerlukan revisi'
          : 'Kontrak telah diajukan, menunggu persetujuan';
      history.add(ProjectHistory(title: title));
    } else if (status == cs.ConsultationStatus.finalStatus) {
      // Required documents stage
      final ex = consultation?.documentExchange;
      final hasAnyDocs =
          ex != null &&
          ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
              (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
              (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
      final hasPermit = (consultation?.permit ?? '').trim().isNotEmpty;
      String title;
      if (!hasAnyDocs) {
        title = 'Sedang menyiapkan dokumen persyaratan';
      } else if (!hasPermit) {
        title = 'Dokumen persyaratan telah diajukan, menunggu persetujuan';
      } else {
        title = 'Dokumen persyaratan telah disetujui';
      }
      history.add(ProjectHistory(title: title));
    } else if (status == cs.ConsultationStatus.doneConsultation) {
      // Finish
      history.add(const ProjectHistory(title: 'Konsultasi selesai'));
    }
    consultationHistory.value = history;
  }

  String? get _consultationId => details.value?.consultation?.consultationId;

  Future<void> acceptConsultation() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync<Consultation>(
      () => _acceptConsultationUseCase(id),
      onSuccess: (c) {
        final current = details.value;
        if (current != null) {
          details.value = current.copyWith(consultation: c);
          _rebuildConsultationHistory(c);
        }
      },
      onFailure: showError,
    );
  }

  Future<void> rejectConsultation() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync<Consultation>(
      () => _rejectConsultationUseCase(id),
      onSuccess: (c) {
        final current = details.value;
        if (current != null) {
          details.value = current.copyWith(consultation: c);
          _rebuildConsultationHistory(c);
        }
      },
      onFailure: showError,
    );
  }

  Future<void> startActiveConsultation() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync<Consultation>(
      () => _startActiveConsultationUseCase(id),
      onSuccess: (c) {
        final current = details.value;
        if (current != null) {
          details.value = current.copyWith(consultation: c);
          _rebuildConsultationHistory(c);
        }
      },
      onFailure: showError,
    );
  }

  Future<void> startRevision({String? notes}) async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync<Consultation>(
      () => _startRevisionUseCase(
        StartRevisionParams(consultationId: id, notes: notes),
      ),
      onSuccess: (c) {
        final current = details.value;
        if (current != null) {
          details.value = current.copyWith(consultation: c);
          _rebuildConsultationHistory(c);
        }
      },
      onFailure: showError,
    );
  }

  Future<void> finalizeConsultation() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync<Consultation>(
      () => _finalizeConsultationUseCase(id),
      onSuccess: (c) {
        final current = details.value;
        if (current != null) {
          details.value = current.copyWith(consultation: c);
          _rebuildConsultationHistory(c);
        }
      },
      onFailure: showError,
    );
  }

  Future<bool> showActionButtons() async {
    User? user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );

    // Helper flags for document stage
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    final hasPermit = (details.value?.consultation?.permit ?? '')
        .trim()
        .isNotEmpty;

    switch (role) {
      case ur.UserRole.homeowner:
        // Homeowner can act on:
        // - Approve/Reject survey schedule
        // - Approve contract (or request revision)
        // - Approve required documents (if docs uploaded but not yet permitted)
        if (status == cs.ConsultationStatus.waitingForScheduleApproval)
          return true;
        if (status == cs.ConsultationStatus.needRevision)
          return true; // contract approval stage
        if (status == cs.ConsultationStatus.finalStatus) {
          return hasAnyDocs && !hasPermit; // approve required documents
        }
        return false;
      case ur.UserRole.consultant:
        // Consultant can act on:
        // - Accept/Reject consultation
        // - Propose/Set survey schedule
        // - Upload contract after survey done
        // - Upload required documents before permit
        if (status == cs.ConsultationStatus.waitingForConfirmation) return true;
        if (status == cs.ConsultationStatus.waitingForSurveySchedule)
          return true;
        if (status == cs.ConsultationStatus.doneSurvey)
          return true; // upload contract
        if (status == cs.ConsultationStatus.finalStatus) {
          return !hasAnyDocs; // upload required documents
        }
        return false;
      default:
        return false;
    }
  }

  Future<bool> showUploadDocumentsButton() async {
    User? user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );

    // Only for consultants during upload stages
    if (role != ur.UserRole.consultant) return false;

    // Contract upload is now done BEFORE completing survey, so do not show at doneSurvey
    // Upload required docs when in FINAL stage and no docs uploaded yet
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    if (status == cs.ConsultationStatus.finalStatus && !hasAnyDocs) return true;

    return false;
  }

  Future<bool> showFinalDocumentsUploadButton() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    if (role != ur.UserRole.consultant) return false;
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    if (status != cs.ConsultationStatus.finalStatus) return false;
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    return !hasAnyDocs; // Only show when nothing has been uploaded yet
  }

  Future<bool> showFinalDocumentsApprovalButtons() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    if (role != ur.UserRole.homeowner) return false;
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    if (status != cs.ConsultationStatus.finalStatus) return false;
    final ex = details.value?.consultation?.documentExchange;
    final hasAnyDocs =
        ex != null &&
        ((ex.currentDed != null && ex.currentDed!.toString().isNotEmpty) ||
            (ex.currentBoq != null && ex.currentBoq!.toString().isNotEmpty) ||
            (ex.currentRab != null && ex.currentRab!.toString().isNotEmpty));
    final hasPermit = (details.value?.consultation?.permit ?? '')
        .trim()
        .isNotEmpty;
    return hasAnyDocs &&
        !hasPermit; // show homeowner approve/reject until permitted
  }

  Future<bool> showFinalizeConsultationButton() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    if (role != ur.UserRole.consultant) return false;
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    if (status != cs.ConsultationStatus.finalStatus) return false;
    final hasPermit = (details.value?.consultation?.permit ?? '')
        .trim()
        .isNotEmpty;
    return hasPermit; // show finalize only after homeowner approval (permit issued)
  }

  void _showUploadContractSheet({Future<void> Function()? afterUpload}) {
    File? selectedFile;
    bool isSubmitting = false;
    super.showBottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          Future<void> doUpload() async {
            if (selectedFile == null) {
              showError(
                const ServerFailure(message: 'Silakan pilih file kontrak'),
              );
              return;
            }
            final id = _consultationId;
            if (id == null || id.isEmpty) {
              showError(const ServerFailure(message: 'Consultation not found'));
              return;
            }
            setState(() => isSubmitting = true);
            await handleAsync(
              () => _uploadContractUseCase(
                UploadContractParams(consultationId: id, file: selectedFile!),
              ),
              onSuccess: (_) async {
                if (afterUpload != null) {
                  await afterUpload();
                }
                if (Get.isBottomSheetOpen ?? false) {
                  goBack();
                }
                await fetchDetails();
              },
              onFailure: showError,
            );
            // Safely update UI state after upload attempt
            setState(() => isSubmitting = false);
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 48),
                    const Text(
                      'Dokumen Kontrak',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: isSubmitting ? null : () => goBack(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.black12,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          selectedFile == null
                              ? 'Dokumen Kontrak'
                              : 'Dipilih: ${selectedFile!.path.split('/').last}',
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: isSubmitting
                          ? null
                          : () async {
                              final result = await FilePicker.platform
                                  .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf'],
                                    withData: false,
                                  );
                              if (result != null &&
                                  result.files.single.path != null) {
                                setState(() {
                                  selectedFile = File(
                                    result.files.single.path!,
                                  );
                                });
                              }
                            },
                      child: const Text('Pilih File'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: (selectedFile == null || isSubmitting)
                      ? null
                      : doUpload,
                  child: isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Unggah'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSetSurveySchedulePressed() {
    super.showBottomSheet(
      ScheduleSurveySheet(
        onSubmit:
            ({
              required String date,
              required String time,
              String? notes,
              String? costFormatted,
            }) async {
              final id = _consultationId;
              if (id == null || id.isEmpty) {
                showError(
                  const ServerFailure(message: 'Consultation not found'),
                );
                return;
              }
              final location =
                  details.value?.project?.location?.address ?? 'Lokasi proyek';
              int? surveyCost;
              if (costFormatted != null && costFormatted.trim().isNotEmpty) {
                final digits = costFormatted.replaceAll(RegExp(r'[^0-9]'), '');
                surveyCost = int.tryParse(digits);
              }
              final req = CreateSurveyScheduleRequest(
                scheduledDate: date,
                scheduledTime: time,
                location: location,
                surveyCost: surveyCost,
                estimatedDurationHours: null,
                surveyType: null,
                notes: notes,
              );
              await handleAsync(
                () => _createSurveyScheduleUseCase(
                  CreateSurveyScheduleParams(consultationId: id, request: req),
                ),
                onSuccess: (_) async {
                  goBack();
                  await fetchDetails();
                },
                onFailure: showError,
              );
            },
      ),
    );
  }

  void onRescheduleSurveyPressed() {
    final schedule = details.value?.consultation?.currentSurveySchedule;
    String? initialDate;
    String? initialTime;
    final raw = schedule?.proposedDateTime;
    if (raw != null && raw.isNotEmpty) {
      try {
        final dt = DateTime.parse(raw);
        initialDate =
            '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
        initialTime =
            '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
      } catch (_) {}
    }

    super.showBottomSheet(
      ScheduleSurveySheet(
        initialDate: initialDate,
        initialTime: initialTime,
        onSubmit:
            ({
              required String date,
              required String time,
              String? notes,
              String? costFormatted,
            }) async {
              final id = _consultationId;
              if (id == null || id.isEmpty) {
                showError(
                  const ServerFailure(message: 'Consultation not found'),
                );
                return;
              }
              final location =
                  details.value?.project?.location?.address ?? 'Lokasi proyek';
              int? surveyCost;
              if (costFormatted != null && costFormatted.trim().isNotEmpty) {
                final digits = costFormatted.replaceAll(RegExp(r'[^0-9]'), '');
                surveyCost = int.tryParse(digits);
              }
              final req = CreateSurveyScheduleRequest(
                scheduledDate: date,
                scheduledTime: time,
                location: location,
                surveyCost: surveyCost,
                notes: notes,
              );
              await handleAsync(
                () => _rescheduleSurveyUseCase(
                  RescheduleSurveyParams(consultationId: id, request: req),
                ),
                onSuccess: (_) async {
                  goBack();
                  await fetchDetails();
                },
                onFailure: showError,
              );
            },
      ),
    );
  }

  Future<void> approveSurveySchedule() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync(
      () => _approveSurveyScheduleUseCase(id),
      onSuccess: (_) async => fetchDetails(),
      onFailure: showError,
    );
  }

  void rejectSurveyBottomSheet() {
    final notesC = TextEditingController();
    super.showBottomSheet(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tolak Jadwal Survey',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => goBack(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesC,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Alasan penolakan (opsional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final id = _consultationId;
                if (id == null || id.isEmpty) {
                  showError(
                    const ServerFailure(message: 'Consultation not found'),
                  );
                  return;
                }
                await handleAsync(
                  () => _rejectSurveyScheduleUseCase(
                    RejectSurveyScheduleParams(
                      consultationId: id,
                      notes: notesC.text.trim().isEmpty
                          ? null
                          : notesC.text.trim(),
                    ),
                  ),
                  onSuccess: (_) async {
                    goBack();
                    await fetchDetails();
                  },
                  onFailure: showError,
                );
              },
              child: const Text('Kirim'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> completeSurvey() async {
    // New flow: upload contract first, then complete survey
    await Future<void>.delayed(Duration.zero);
    _showUploadContractSheet(
      afterUpload: () async {
        final id = _consultationId;
        if (id == null || id.isEmpty) {
          showError(const ServerFailure(message: 'Consultation not found'));
          return;
        }
        await handleAsync(
          () => _completeSurveyUseCase(id),
          onSuccess: (_) async {},
          onFailure: showError,
        );
      },
    );
  }

  void onUploadFinalDocumentsPressed() {
    String? dedPath;
    String? rabPath;
    String? spektekPath;
    bool isSubmitting = false;
    super.showBottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          Future<void> pick(String type) async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            );
            if (result != null && result.files.single.path != null) {
              setState(() {
                switch (type) {
                  case 'DED':
                    dedPath = result.files.single.path;
                    break;
                  case 'RAB':
                    rabPath = result.files.single.path;
                    break;
                  case 'SPEK':
                    spektekPath = result.files.single.path;
                    break;
                }
              });
            }
          }

          Future<void> upload() async {
            final id = _consultationId;
            if (id == null || id.isEmpty) {
              showError(const ServerFailure(message: 'Consultation not found'));
              return;
            }
            if (dedPath == null || rabPath == null || spektekPath == null) {
              showError(
                const ServerFailure(
                  message: 'Pilih semua dokumen: DED, RAB, Spektek',
                ),
              );
              return;
            }
            setState(() => isSubmitting = true);

            // NOTE: API expects URLs; if backend requires presigned upload then this should be changed to upload files and send URLs.
            // For now, we pass local paths as placeholders or assume the app converts to URLs elsewhere.
            await handleAsync(
              () => _uploadFinalDocumentsUseCase(
                UploadFinalDocumentsParams(
                  consultationId: id,
                  fileDedUrl: dedPath!,
                  fileRabUrl: rabPath!,
                  fileSpektekUrl: spektekPath!,
                ),
              ),
              onSuccess: (_) async {
                if (Get.isBottomSheetOpen ?? false) goBack();
                await fetchDetails();
              },
              onFailure: showError,
            );
            setState(() => isSubmitting = false);
          }

          Widget row(String label, String? path, VoidCallback onPick) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.black12,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        path == null
                            ? label
                            : 'Dipilih: ${path.split('/').last}',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: isSubmitting ? null : onPick,
                child: const Text('Pilih File'),
              ),
            ],
          );

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 48),
                    const Text(
                      'Dokumen Persyaratan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: isSubmitting ? null : () => goBack(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                row('DED', dedPath, () => pick('DED')),
                const SizedBox(height: 12),
                row('RAB', rabPath, () => pick('RAB')),
                const SizedBox(height: 12),
                row('Spektek', spektekPath, () => pick('SPEK')),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isSubmitting ? null : upload,
                  child: isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Unggah'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> approveFinalDocuments() async {
    final id = _consultationId;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'Consultation not found'));
      return;
    }
    await handleAsync(
      () => _approveFinalDocumentsUseCase(id),
      onSuccess: (_) async => fetchDetails(),
      onFailure: showError,
    );
  }

  void rejectFinalDocumentsBottomSheet() {
    final notesC = TextEditingController();
    super.showBottomSheet(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tolak Dokumen Persyaratan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => goBack(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesC,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Alasan penolakan (opsional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final id = _consultationId;
                if (id == null || id.isEmpty) {
                  showError(
                    const ServerFailure(message: 'Consultation not found'),
                  );
                  return;
                }
                await handleAsync(
                  () => _rejectFinalDocumentsUseCase(
                    RejectFinalDocumentsParams(
                      consultationId: id,
                      notes: notesC.text.trim().isEmpty
                          ? null
                          : notesC.text.trim(),
                    ),
                  ),
                  onSuccess: (_) async {
                    goBack();
                    await fetchDetails();
                  },
                  onFailure: showError,
                );
              },
              child: const Text('Kirim'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> onHistoryDownload(ProjectHistory h) async {
    final files = (h.attachments?.isNotEmpty == true)
        ? h.attachments!
        : (h.files?.isNotEmpty == true ? h.files! : <String>[]);
    if (files.isEmpty) return;

    Future<void> open(String url) async {
      await Clipboard.setData(ClipboardData(text: url));
      Get.snackbar(
        'Download',
        'Tautan disalin ke clipboard',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    if (files.length == 1) {
      await open(files.first);
      return;
    }

    super.showBottomSheet(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih Berkas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => goBack(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (final url in files)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: OutlinedButton(
                  onPressed: () async {
                    await open(url);
                    goBack();
                  },
                  child: Text(url.split('/').last),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Visibility: consultant can set schedule when waiting for schedule
  Future<bool> showSetSurveyScheduleButton() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    return role == ur.UserRole.consultant &&
        status == cs.ConsultationStatus.waitingForSurveySchedule;
  }

  // Visibility: consultant can complete (after uploading contract) when survey scheduled
  Future<bool> showCompleteSurveyButton() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    return role == ur.UserRole.consultant &&
        status == cs.ConsultationStatus.surveyScheduled;
  }

  // Visibility: homeowner can approve/reject proposed schedule
  Future<bool> showHomeownerScheduleApprovalButtons() async {
    final user = await _userStorage.getUser();
    final role = ur.userRoleFromString(user?.role);
    final status = cs.consultationStatusFromString(
      details.value?.consultation?.status,
    );
    return role == ur.UserRole.homeowner &&
        status == cs.ConsultationStatus.waitingForScheduleApproval;
  }

  // Delegate generic upload button to final documents upload flow
  void onUploadDocumentsPressed() => onUploadFinalDocumentsPressed();
}
