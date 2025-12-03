import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';

class ConsultationConfirmationController extends BaseController {
  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;
  late final Project project;

  final RxString selectedSurveyOption = 'Tidak perlu survey'.obs;
  final Rxn<DateTime> selectedSurveyDate = Rxn<DateTime>();
  final Rxn<TimeOfDay> selectedSurveyTime = Rxn<TimeOfDay>();

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

  ConsultationConfirmationController(this._createDirectChatRoomUseCase);

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is ConsultationDetailsArgs) {
      project = args.project;
    } else if (args is Map<String, dynamic>) {
      project = (args['project'] as Project?) ?? const Project();
    } else {
      project = const Project();
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

  void onAccept() {
    navigateAndClearUntil(
      AppRoutes.consultationDetails,
      untilRoute: AppRoutes.main,
      arguments: ConsultationDetailsArgs(project: project),
    );
  }

  void onReject() {
    // TODO: hook into reject flow
    Get.back();
  }

  Future<void> startChatWithHomeOwner() async {
    final homeOwnerId = project.consultationInfo?.homeOwnerId;
    if (homeOwnerId == null) {
      showError(const ServerFailure(message: 'ID pemilik tidak tersedia'));
      return;
    }
    final name =
        project.consultationInfo?.homeOwnerName?.trim().isNotEmpty == true
        ? project.consultationInfo!.homeOwnerName!
        : 'Homeowner';

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
}
