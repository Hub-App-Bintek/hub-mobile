import 'package:get/get.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/core/network/services/chat_api_service.dart';
import 'package:pkp_hub/core/network/services/consultant_api_service.dart';
import 'package:pkp_hub/core/network/services/consultation_api_service.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/core/network/services/design_api_service.dart';
import 'package:pkp_hub/core/network/services/final_document_api_service.dart';
import 'package:pkp_hub/core/network/services/payment_api_service.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/core/network/services/revision_api_service.dart';
import 'package:pkp_hub/core/network/services/survey_api_service.dart';
import 'package:pkp_hub/core/network/services/files_api_service.dart';
import 'package:pkp_hub/core/network/services/wallet_api_service.dart';

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
    Get.lazyPut<ChatApiService>(
      () => ChatApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<ConsultantApiService>(
      () => ConsultantApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<ConsultationApiService>(
      () => ConsultationApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<ContractApiService>(
      () => ContractApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<DesignApiService>(
      () => DesignApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<FinalDocumentApiService>(
      () => FinalDocumentApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<PaymentApiService>(
      () => PaymentApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<RevisionApiService>(
      () => RevisionApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<SurveyApiService>(
      () => SurveyApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<FilesApiService>(
      () => FilesApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<WalletApiService>(
      () => WalletApiService(Get.find<ApiClient>().dio),
      fenix: true,
    );
  }
}
