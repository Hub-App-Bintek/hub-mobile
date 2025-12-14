import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';
import 'package:pkp_hub/domain/repositories/payment_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/approve_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/ask_contract_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/create_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_revised_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/sign_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/generate_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/download_contract_version_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultation_detail_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/cancel_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/approve_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/ask_design_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/get_design_document_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/upload_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/download_design_version_use_case.dart';
import 'package:pkp_hub/domain/usecases/payment/get_payments_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';

class ConsultationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetConsultationDetailUseCase>(
      () => GetConsultationDetailUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetContractVersionsUseCase>(
      () => GetContractVersionsUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<CancelConsultationUseCase>(
      () => CancelConsultationUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<CreateContractDraftUseCase>(
      () => CreateContractDraftUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<GenerateContractDraftUseCase>(
      () => GenerateContractDraftUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<UploadRevisedContractUseCase>(
      () => UploadRevisedContractUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<ApproveContractUseCase>(
      () => ApproveContractUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<AskContractRevisionUseCase>(
      () => AskContractRevisionUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<SignContractUseCase>(
      () => SignContractUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<UploadDesignDocumentsUseCase>(
      () => UploadDesignDocumentsUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetPaymentsUseCase>(
      () => GetPaymentsUseCase(Get.find<PaymentRepository>()),
      fenix: true,
    );
    Get.lazyPut<ApproveDesignDocumentsUseCase>(
      () => ApproveDesignDocumentsUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetConsultationDetailUseCase>(
      () => GetConsultationDetailUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetContractVersionsUseCase>(
      () => GetContractVersionsUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<CreateContractDraftUseCase>(
      () => CreateContractDraftUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<ApproveContractUseCase>(
      () => ApproveContractUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<AskContractRevisionUseCase>(
      () => AskContractRevisionUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<SignContractUseCase>(
      () => SignContractUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<UploadDesignDocumentsUseCase>(
      () => UploadDesignDocumentsUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<ApproveDesignDocumentsUseCase>(
      () => ApproveDesignDocumentsUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<AskDesignRevisionUseCase>(
      () => AskDesignRevisionUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetDesignDocumentVersionsUseCase>(
      () => GetDesignDocumentVersionsUseCase(
        Get.find<DesignDocumentRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<AskDesignRevisionUseCase>(
      () => AskDesignRevisionUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetDesignDocumentVersionsUseCase>(
      () => GetDesignDocumentVersionsUseCase(
        Get.find<DesignDocumentRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<DownloadDesignVersionUseCase>(
      () => DownloadDesignVersionUseCase(Get.find<DesignDocumentRepository>()),
      fenix: true,
    );
    Get.lazyPut<DownloadContractVersionUseCase>(
      () => DownloadContractVersionUseCase(Get.find<ContractRepository>()),
      fenix: true,
    );
    Get.lazyPut<ConsultationDetailsController>(
      () => ConsultationDetailsController(
        Get.find<UserStorage>(),
        Get.find<CreateDirectChatRoomUseCase>(),
        Get.find<GetConsultationDetailUseCase>(),
        Get.find<CancelConsultationUseCase>(),
        Get.find<GetContractVersionsUseCase>(),
        Get.find<CreateContractDraftUseCase>(),
        Get.find<UploadRevisedContractUseCase>(),
        Get.find<GenerateContractDraftUseCase>(),
        Get.find<ApproveContractUseCase>(),
        Get.find<AskContractRevisionUseCase>(),
        Get.find<SignContractUseCase>(),
        Get.find<UploadDesignDocumentsUseCase>(),
        Get.find<ApproveDesignDocumentsUseCase>(),
        Get.find<AskDesignRevisionUseCase>(),
        Get.find<GetDesignDocumentVersionsUseCase>(),
        Get.find<DownloadDesignVersionUseCase>(),
        Get.find<DownloadContractVersionUseCase>(),
        Get.find<GetPaymentsUseCase>(),
      ),
      fenix: true,
    );
  }
}
