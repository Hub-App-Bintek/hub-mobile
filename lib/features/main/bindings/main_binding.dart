import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/wallet/get_wallet_balance_use_case.dart';
import 'package:pkp_hub/features/main/bindings/projects_binding.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';
import 'package:pkp_hub/features/main/controllers/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
          () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>())
    );
    Get.lazyPut(() => MainController(Get.find<UserStorage>()));

    Get.lazyPut(() => GetWalletBalanceUseCase(Get.find()));
    Get.lazyPut(() => GetConsultantsUseCase(Get.find<ConsultantRepository>()));
    Get.lazyPut(() => GetProjectsUseCase(Get.find<ProjectRepository>()));

    Get.lazyPut(
      () => HomeController(
        Get.find<UserStorage>(),
        Get.find<GetProjectsUseCase>(),
        Get.find<GetWalletBalanceUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut(() => ProfileController(Get.find<UserStorage>()));

    final args = Get.arguments;
    String? status;
    if (args is ProjectsRouteArgs) {
      status = args.status;
    } else if (args is Map<String, dynamic>) {
      status = args['status'] as String?;
    }
    ProjectsBinding.register(tag: ProjectsBinding.mainTag, status: status);
  }
}
