import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/accept_consultation_request.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_v2_use_case.dart';

class ConsultationConfirmationController extends BaseController {
  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;
  final AcceptConsultationUseCase _acceptConsultationUseCase;
  final RejectConsultationUseCase _rejectConsultationUseCase;
  final GetProjectV2UseCase _getProjectV2UseCase;

  final Rxn<ProjectDetailsResponse> projectDetail =
      Rxn<ProjectDetailsResponse>();

  final RxString selectedSurveyOption = 'Tidak perlu survey'.obs;
  final Rxn<DateTime> selectedSurveyDate = Rxn<DateTime>();
  final Rxn<TimeOfDay> selectedSurveyTime = Rxn<TimeOfDay>();
  final RxBool isRejecting = false.obs;

  final List<String> surveyOptions = const [
    'Tidak perlu survey',
    'Perlu survey',
  ];

  void onSurveyOptionChanged(String? value) {
    if (value == null || value.isEmpty) return;
    selectedSurveyOption.value = value;
    if (!requiresSurvey) {
      selectedSurveyDate.value = null;
      selectedSurveyTime.value = null;
    }
  }

  bool get requiresSurvey => selectedSurveyOption.value == 'Perlu survey';

  ConsultationConfirmationController(
    this._createDirectChatRoomUseCase,
    this._acceptConsultationUseCase,
    this._rejectConsultationUseCase,
    this._getProjectV2UseCase,
  );

  @override
  void onInit() {
    super.onInit();
    String? projectId;
    final args = Get.arguments;
    if (args is ConsultationDetailsArgs) {
      projectId = args.project?.projectId ?? '';
    } else if (args is Map<String, dynamic>) {
      projectId =
          (args['project'] as Project?)?.projectId ??
          (args['projectId'] as String?);
    }
    if (projectId != null && projectId.isNotEmpty) {
      _fetchProjectDetail(projectId);
    }
  }

  Future<void> pickSurveyDate() async {
    final ctx = Get.context;
    if (ctx == null) return;
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: ctx,
      initialDate: selectedSurveyDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      selectedSurveyDate.value = picked;
    }
  }

  Future<void> pickSurveyTime() async {
    final ctx = Get.context;
    if (ctx == null) return;
    final picked = await showTimePicker(
      context: ctx,
      initialTime: selectedSurveyTime.value ?? TimeOfDay.now(),
    );
    if (picked != null) {
      selectedSurveyTime.value = picked;
    }
  }

  Future<void> onAccept() async {
    final consultationId =
        projectDetail.value?.consultationInfo?.consultationId ??
        projectDetail.value?.projectId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak tersedia'));
      return;
    }

    if (requiresSurvey &&
        (selectedSurveyDate.value == null ||
            selectedSurveyTime.value == null)) {
      showError(
        const ServerFailure(
          message: 'Tanggal dan waktu survey wajib diisi untuk survey.',
        ),
      );
      return;
    }

    final request = AcceptConsultationRequest(
      needsSurvey: requiresSurvey,
      surveyDate: requiresSurvey ? _formatSurveyDate() : null,
      surveyTime: requiresSurvey ? _formatSurveyTime() : null,
      notes: null,
    );

    await handleAsync<Consultation>(
      () => _acceptConsultationUseCase(
        AcceptConsultationPayload(
          consultationId: consultationId,
          request: request,
        ),
      ),
      onSuccess: (acceptedConsultation) async {
        final project = _toProject(projectDetail.value);
        navigateAndClearUntil(
          AppRoutes.consultationDetails,
          untilRoute: AppRoutes.main,
          arguments: ConsultationDetailsArgs(project: project),
        );
      },
      onFailure: showError,
    );
  }

  Project? _toProject(ProjectDetailsResponse? details) {
    if (details == null) return null;
    return Project(
      projectId: details.projectId,
      projectName: details.projectName,
      projectStatus: details.projectStatus,
      state: details.projectState,
      stateDescription: details.projectStateDescription,
      consultationInfo: details.consultationInfo,
    );
  }

  void onReject() {
    final consultationId =
        projectDetail.value?.consultationInfo?.consultationId ??
        projectDetail.value?.projectId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak tersedia'));
      return;
    }
    if (isRejecting.value) return;

    isRejecting.value = true;
    handleAsync<Consultation>(
      () => _rejectConsultationUseCase(consultationId),
      onSuccess: (_) {
        Get.back();
        Get.snackbar(
          'Ditolak',
          'Konsultasi berhasil ditolak.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successDark,
          colorText: AppColors.white,
        );
      },
      onFailure: showError,
    ).whenComplete(() {
      isRejecting.value = false;
    });
  }

  Future<void> startChatWithHomeOwner() async {
    final homeOwnerId = projectDetail.value?.consultationInfo?.homeOwnerId;
    if (homeOwnerId == null) {
      showError(const ServerFailure(message: 'ID pemilik tidak tersedia'));
      return;
    }

    final name =
        projectDetail.value?.consultationInfo?.homeOwnerName?.trim() ?? '-';
    await handleAsync(
      () => _createDirectChatRoomUseCase(homeOwnerId),
      onSuccess: (room) {
        navigateTo(
          AppRoutes.chat,
          arguments: ChatArgs(name: name, roomId: room.id),
        );
      },
      onFailure: showError,
    );
  }

  String? _formatSurveyDate() {
    final date = selectedSurveyDate.value;
    if (date == null) return null;
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  String? _formatSurveyTime() {
    final time = selectedSurveyTime.value;
    if (time == null) return null;
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _fetchProjectDetail(String projectId) async {
    await handleAsync<ProjectDetailsResponse>(
      () => _getProjectV2UseCase(projectId),
      onSuccess: (response) {
        projectDetail.value = response;
      },
      onFailure: showError,
    );
  }
}
