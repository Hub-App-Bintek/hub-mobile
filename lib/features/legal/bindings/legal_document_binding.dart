import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/legal_repository.dart';
import 'package:pkp_hub/domain/usecases/legal/get_legal_document_use_case.dart';
import 'package:pkp_hub/features/legal/controllers/legal_document_controller.dart';

class LegalDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetLegalDocumentUseCase(Get.find<LegalRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => LegalDocumentController(Get.find<GetLegalDocumentUseCase>()),
      fenix: true,
    );
  }
}
