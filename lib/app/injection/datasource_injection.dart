import 'package:get/get.dart';
import 'package:pkp_hub/features/auth/data/datasources/auth_remote_data_source.dart';

class DataSourceInjection {
  DataSourceInjection._();

  static void init() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(Get.find()),
      fenix: true,
    );
  }
}
