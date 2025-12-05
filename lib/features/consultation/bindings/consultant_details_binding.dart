import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

import '../controllers/consultant_details_controller.dart';

class ConsultantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantPortfoliosUseCase>(
      () => GetConsultantPortfoliosUseCase(Get.find<ConsultantRepository>()),
      fenix: true,
    );

    // Register create consultation use case
    Get.lazyPut<CreateConsultationUseCase>(
      () => CreateConsultationUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );

    Get.lazyPut<ConsultantDetailsController>(() {
      final rawArgs = Get.arguments;
      ConsultantDetailsArgs? args;
      if (rawArgs is ConsultantDetailsArgs) {
        args = rawArgs;
      } else if (rawArgs is Map<String, dynamic>) {
        args = ConsultantDetailsArgs(
          consultantId: rawArgs['consultantId'] ?? '',
          projectId: rawArgs['projectId'] ?? '',
          isPaidConsultation: rawArgs['isPaidConsultation'] ?? false,
          consultation: rawArgs['consultation'],
          requireLoginForAction:
              rawArgs['requireLoginForAction'] as bool? ?? false,
        );
      }
      args ??= const ConsultantDetailsArgs(consultantId: '', projectId: '');
      return ConsultantDetailsController(
        args.consultantId,
        args.projectId,
        args.isPaidConsultation,
        Get.find<UserStorage>(),
        Get.find<GetConsultantPortfoliosUseCase>(),
        Get.find<CreateConsultationUseCase>(),
        Get.find<CreateDirectChatRoomUseCase>(),
        args.consultation as Consultant?,
        args.requireLoginForAction,
      );
    }, fenix: true);
  }
}
