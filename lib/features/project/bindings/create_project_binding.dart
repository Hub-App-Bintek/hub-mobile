import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/features/project/controllers/create_project_controller.dart';

class CreateProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectUseCase>(
      () => CreateProjectUseCase(Get.find<ProjectRepository>()),
    );
    Get.lazyPut<CreateProjectController>(
      () => CreateProjectController(Get.find<CreateProjectUseCase>()),
    );
  }
}
