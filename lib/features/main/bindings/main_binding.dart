import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(Get.find<UserStorage>()));

    Get.lazyPut(() => GetProjectsUseCase(Get.find<ProjectRepository>()));
    Get.lazyPut(
      () => HomeController(
        Get.find<UserStorage>(),
        Get.find<GetProjectsUseCase>(),
      ),
    );
    Get.lazyPut(() => ProjectsController(Get.find<GetProjectsUseCase>()));
  }
}
