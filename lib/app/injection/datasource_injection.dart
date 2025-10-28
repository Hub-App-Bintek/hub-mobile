import 'package:get/get.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/core/network/services/consultant_api_service.dart';
import 'package:pkp_hub/core/network/services/consultation_api_service.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/datasources/auth/auth_local_data_source.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultant/consultant_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultation/consultation_network_data_source.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/datasources/chat/chat_network_data_source.dart';
import 'package:pkp_hub/data/datasources/revision/revision_network_data_source.dart'
    as revds;
import 'package:pkp_hub/data/datasources/payment/payment_network_data_source.dart';
import 'package:pkp_hub/data/datasources/final_document/final_document_network_data_source.dart';
import 'package:pkp_hub/data/datasources/design/design_network_data_source.dart'
    as designds;
import 'package:pkp_hub/data/datasources/survey/survey_network_data_source.dart';

class DataSourceInjection {
  DataSourceInjection._();

  static void init() {
    // Local Data Sources
    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(Get.find<UserStorage>()),
      fenix: true,
    );

    // Network Data Sources
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
    Get.lazyPut<ConsultantNetworkDataSource>(
      () => ConsultantNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<ConsultantApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ConsultationNetworkDataSource>(
      () => ConsultationNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<ConsultationApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<SurveyNetworkDataSource>(
      () => SurveyNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<ContractNetworkDataSource>(
      () => ContractNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<ChatNetworkDataSource>(
      () => ChatNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<revds.RevisionNetworkDataSource>(
      () => revds.RevisionNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<PaymentNetworkDataSource>(
      () => PaymentNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<FinalDocumentNetworkDataSource>(
      () => FinalDocumentNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<designds.DesignNetworkDataSource>(
      () => designds.DesignNetworkDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
  }
}
