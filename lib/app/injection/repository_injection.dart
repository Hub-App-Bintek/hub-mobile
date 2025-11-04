import 'package:get/get.dart';
import 'package:pkp_hub/data/datasources/auth/auth_local_data_source.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultant/consultant_network_data_source.dart';
import 'package:pkp_hub/data/datasources/consultation/consultation_network_data_source.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';
import 'package:pkp_hub/data/datasources/wallet/wallet_local_repository.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/revision_repository.dart';
import 'package:pkp_hub/domain/repositories/payment_repository.dart';
import 'package:pkp_hub/domain/repositories/final_document_repository.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';
import 'package:pkp_hub/data/datasources/survey/survey_network_data_source.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/datasources/chat/chat_network_data_source.dart';
import 'package:pkp_hub/data/datasources/revision/revision_network_data_source.dart'
    as revds;
import 'package:pkp_hub/data/datasources/design/design_network_data_source.dart'
    as designds;
import 'package:pkp_hub/data/datasources/payment/payment_network_data_source.dart'
    as payds;
import 'package:pkp_hub/data/datasources/final_document/final_document_network_data_source.dart'
    as fdds;
import 'package:pkp_hub/domain/repositories/files_repository.dart';
import 'package:pkp_hub/data/datasources/files/files_network_data_source.dart'
    as filesds;
import 'package:pkp_hub/data/datasources/wallet/wallet_network_data_source.dart';
import 'package:pkp_hub/domain/repositories/wallet_repository.dart';

class RepositoryInjection {
  RepositoryInjection._();

  static void init() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        Get.find<AuthNetworkDataSource>(),
        Get.find<AuthLocalDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ProjectRepository>(
      () => ProjectRepositoryImpl(Get.find<ProjectNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ConsultantRepository>(
      () => ConsultantRepositoryImpl(Get.find<ConsultantNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ConsultationRepository>(
      () =>
          ConsultationRepositoryImpl(Get.find<ConsultationNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<SurveyRepository>(
      () => SurveyRepositoryImpl(Get.find<SurveyNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ContractRepository>(
      () => ContractRepositoryImpl(Get.find<ContractNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ChatRepository>(
      () => ChatRepositoryImpl(Get.find<ChatNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<RevisionRepository>(
      () => RevisionRepositoryImpl(Get.find<revds.RevisionNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<PaymentRepository>(
      () => PaymentRepositoryImpl(Get.find<payds.PaymentNetworkDataSource>()),
      fenix: true,
    );
    Get.lazyPut<FinalDocumentRepository>(
      () => FinalDocumentRepositoryImpl(
        Get.find<fdds.FinalDocumentNetworkDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut<DesignRepository>(
      () => DesignRepositoryImpl(Get.find<designds.DesignNetworkDataSource>()),
      fenix: true,
    );

    // Files repository (for downloading binary files)
    Get.lazyPut<FilesRepository>(
      () => FilesRepositoryImpl(Get.find<filesds.FilesNetworkDataSource>()),
      fenix: true,
    );

    // Wallet repository
    Get.lazyPut<WalletRepository>(
      () => WalletRepositoryImpl(
        Get.find<WalletNetworkDataSource>(),
        Get.find<WalletLocalDataSource>(),
      ),
      fenix: true,
    );
  }
}
