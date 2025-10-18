import 'package:get/get.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';

class DataSourceInjection {
  DataSourceInjection._();

  static void init() {
    Get.lazyPut<AuthNetworkDataSource>(
      () => AuthNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<AuthApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ProjectNetworkDataSource>(
      () => ProjectNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<ProjectApiService>(),
      ),
      fenix: true,
    );
  }
}
