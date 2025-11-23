import 'package:get/get.dart';

import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

class ProjectsBinding extends Bindings {
  ProjectsBinding();

  static const String mainTag = 'projects_main';
  static const String routeTag = 'projects_route';

  static void register({required String tag, String? status}) {
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(Get.find<GetProjectsUseCase>(), status),
      tag: tag,
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
