import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';

class RepositoryInjection {
  RepositoryInjection._();

  static void init() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ProjectRepository>(
      () => ProjectRepositoryImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<ConsultantRepository>(
      () => ConsultantRepositoryImpl(Get.find()),
      fenix: true,
    );
  }
}
