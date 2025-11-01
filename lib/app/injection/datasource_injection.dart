import 'package:get/get.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/core/network/services/chat_api_service.dart';
import 'package:pkp_hub/core/network/services/consultant_api_service.dart';
import 'package:pkp_hub/core/network/services/consultation_api_service.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/core/network/services/design_api_service.dart';
import 'package:pkp_hub/core/network/services/files_api_service.dart';
import 'package:pkp_hub/core/network/services/final_document_api_service.dart';
import 'package:pkp_hub/core/network/services/payment_api_service.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/core/network/services/revision_api_service.dart';
import 'package:pkp_hub/core/network/services/survey_api_service.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/datasources/auth/auth_local_data_source.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/datasources/chat/chat_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultant/consultant_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultation/consultation_network_data_source.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/datasources/design/design_network_data_source.dart'
    as designds;
import 'package:pkp_hub/data/datasources/final_document/final_document_network_data_source.dart';
import 'package:pkp_hub/data/datasources/payment/payment_network_data_source.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';
import 'package:pkp_hub/data/datasources/revision/revision_network_data_source.dart'
    as revds;
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
      () => SurveyNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<SurveyApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ContractNetworkDataSource>(
      () => ContractNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<ContractApiService>(),
        Get.find<FilesApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ChatNetworkDataSource>(
      () => ChatNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<ChatApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<revds.RevisionNetworkDataSource>(
      () => revds.RevisionNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<RevisionApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<PaymentNetworkDataSource>(
      () => PaymentNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<PaymentApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<FinalDocumentNetworkDataSource>(
      () => FinalDocumentNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<FinalDocumentApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<designds.DesignNetworkDataSource>(
      () => designds.DesignNetworkDataSourceImpl(
        Get.find<ApiClient>(),
        Get.find<DesignApiService>(),
      ),
      fenix: true,
    );
  }
}
