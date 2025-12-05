import 'package:get/get.dart';

import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class ProjectsBinding extends Bindings {
  ProjectsBinding();

  static const String mainTag = 'projects_main';
  static const String routeTag = 'projects_route';

  static void registerMainController() {
    // 1. Register the required UseCase first.
    //    Use fenix:true so it can be re-used by the route binding later.
    Get.lazyPut<CreateDirectChatRoomUseCase>(
          () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );

    // 2. Register the ProjectsController for the main screen.
    //    This one does not have a status filter.
    Get.lazyPut<ProjectsController>(
          () => ProjectsController(
        Get.find<GetProjectsUseCase>(),
        null, // No status for the main projects tab
        Get.find<UserStorage>(),
        Get.find<CreateDirectChatRoomUseCase>(),
      ),
      tag: mainTag,
      fenix: true,
    );
  }

  static void register({required String tag, String? status}) {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(
        Get.find<GetProjectsUseCase>(),
        status,
        Get.find<UserStorage>(),
        Get.find<CreateDirectChatRoomUseCase>(),
      ),
      tag: tag,
      fenix: true,
    );
  }

  @override
  void dependencies() {
    final args = Get.arguments;
    String? status;
    if (args is ProjectsRouteArgs) {
      status = args.status;
    } else if (args is Map<String, dynamic>) {
      status = args['status'] as String?;
    }
    register(tag: routeTag, status: status);
  }
}
