import 'package:get/get.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/core/network/services/consultant_api_service.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';

class NetworkServiceInjection {
  NetworkServiceInjection._();

  static void init() {
    Get.lazyPut<AuthApiService>(
      () => AuthApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<ProjectApiService>(
      () => ProjectApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<ConsultantApiService>(
      () => ConsultantApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
  }
}
