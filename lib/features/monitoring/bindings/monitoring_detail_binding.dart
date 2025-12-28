import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';
import 'package:pkp_hub/domain/usecases/monitoring/approve_completion_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_findings_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_contracts_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_detail_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_documents_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_reports_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/respond_to_contract_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/upload_document_usecase.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_detail_controller.dart';

import '../../../domain/usecases/monitoring/sign_contract_usecase.dart';

class MonitoringDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Inject use cases for fetching details, approving contracts, etc.
    Get.lazyPut(() => GetReportsUseCase(Get.find<MonitoringRepository>()));
    Get.lazyPut(() => GetFindingsUseCase(Get.find<MonitoringRepository>()));
    Get.lazyPut(
      () => RespondToContractUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(() => SignContractUseCase(Get.find<MonitoringRepository>()));
    Get.lazyPut(
      () => GetMonitoringDetailUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(
      () => ApproveCompletionUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(() => GetMonitoringDocumentsUseCase(Get.find<MonitoringRepository>()));
    Get.lazyPut(() => UploadDocumentUseCase(Get.find<MonitoringRepository>()));
    Get.lazyPut(() => GetMonitoringContractsUsecase(Get.find<MonitoringRepository>()));
    Get.lazyPut(
      () => MonitoringDetailController(
        Get.find<GetReportsUseCase>(),
        Get.find<GetFindingsUseCase>(),
        Get.find<RespondToContractUseCase>(),
        Get.find<SignContractUseCase>(),
        Get.find<GetMonitoringDetailUseCase>(),
        Get.find<ApproveCompletionUseCase>(),
        Get.find<UploadDocumentUseCase>(),
        Get.find<GetMonitoringDocumentsUseCase>(),
        Get.find<GetMonitoringContractsUsecase>(),
      ),
    );
  }
}
