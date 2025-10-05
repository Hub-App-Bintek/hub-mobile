import 'package:get/get.dart';
import 'package:pkp_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pkp_hub/features/auth/domain/repositories/auth_repository.dart';

class RepositoryInjection {
  RepositoryInjection._();

  static void init() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find()),
      fenix: true,
    );
  }
}
