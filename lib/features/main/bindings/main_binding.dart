import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';
import 'package:pkp_hub/features/main/controllers/project_list_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(Get.find<AuthStorage>()));

    Get.lazyPut(() => GetProjectListUseCase(Get.find<ProjectRepository>()));
    Get.lazyPut(
      () => HomeController(
        Get.find<AuthStorage>(),
        Get.find<GetProjectListUseCase>(),
      ),
    );
    Get.lazyPut(() => ProjectListController(Get.find<GetProjectListUseCase>()));
  }
}
