import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/files_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/domain/repositories/final_document_repository.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_active_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/start_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/finalize_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/create_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/approve_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reject_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/reschedule_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/survey/complete_survey_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/approve_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/ask_contract_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/upload_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/approve_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/final_document/reject_final_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/generate_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/files/download_file_use_case.dart';
import 'package:pkp_hub/features/project/controllers/project_details_controller.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetProjectDetailsUseCase>(
      () => GetProjectDetailsUseCase(Get.find<ProjectRepository>()),
    );

    // Ensure consultation use cases are available (they may already be registered elsewhere)
    Get.lazyPut<AcceptConsultationUseCase>(
      () => AcceptConsultationUseCase(Get.find<ConsultationRepository>()),
    );
    Get.lazyPut<RejectConsultationUseCase>(
      () => RejectConsultationUseCase(Get.find<ConsultationRepository>()),
    );
    Get.lazyPut<StartActiveConsultationUseCase>(
      () => StartActiveConsultationUseCase(Get.find<ConsultationRepository>()),
    );
    Get.lazyPut<StartRevisionUseCase>(
      () => StartRevisionUseCase(Get.find<ConsultationRepository>()),
    );
    Get.lazyPut<FinalizeConsultationUseCase>(
      () => FinalizeConsultationUseCase(Get.find<ConsultationRepository>()),
    );
    Get.lazyPut<CreateSurveyScheduleUseCase>(
      () => CreateSurveyScheduleUseCase(Get.find<SurveyRepository>()),
    );
    Get.lazyPut<ApproveSurveyScheduleUseCase>(
      () => ApproveSurveyScheduleUseCase(Get.find<SurveyRepository>()),
    );
    Get.lazyPut<RejectSurveyScheduleUseCase>(
      () => RejectSurveyScheduleUseCase(Get.find<SurveyRepository>()),
    );
    Get.lazyPut<RescheduleSurveyUseCase>(
      () => RescheduleSurveyUseCase(Get.find<SurveyRepository>()),
    );
    Get.lazyPut<CompleteSurveyUseCase>(
      () => CompleteSurveyUseCase(Get.find<SurveyRepository>()),
    );
    Get.lazyPut<UploadContractUseCase>(
      () => UploadContractUseCase(Get.find<ContractRepository>()),
    );
    // New contract flows
    Get.lazyPut<GetContractUseCase>(
      () => GetContractUseCase(Get.find<ContractRepository>()),
    );
    Get.lazyPut<ApproveContractUseCase>(
      () => ApproveContractUseCase(Get.find<ContractRepository>()),
    );
    Get.lazyPut<AskContractRevisionUseCase>(
      () => AskContractRevisionUseCase(Get.find<ContractRepository>()),
    );
    Get.lazyPut<GenerateContractDraftUseCase>(
      () => GenerateContractDraftUseCase(Get.find<ContractRepository>()),
    );
    Get.lazyPut<DownloadFileUseCase>(
      () => DownloadFileUseCase(Get.find<FilesRepository>()),
      fenix: true,
    );
    Get.lazyPut<UploadFinalDocumentsUseCase>(
      () => UploadFinalDocumentsUseCase(Get.find<FinalDocumentRepository>()),
    );
    Get.lazyPut<ApproveFinalDocumentsUseCase>(
      () => ApproveFinalDocumentsUseCase(Get.find<FinalDocumentRepository>()),
    );
    Get.lazyPut<RejectFinalDocumentsUseCase>(
      () => RejectFinalDocumentsUseCase(Get.find<FinalDocumentRepository>()),
    );

    Get.lazyPut<ProjectDetailsController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      final projectId = args?['projectId'] as String? ?? '';
      return ProjectDetailsController(
        projectId,
        Get.find<GetProjectDetailsUseCase>(),
        Get.find<UserStorage>(),
        Get.find<AcceptConsultationUseCase>(),
        Get.find<RejectConsultationUseCase>(),
        Get.find<StartActiveConsultationUseCase>(),
        Get.find<StartRevisionUseCase>(),
        Get.find<FinalizeConsultationUseCase>(),
        Get.find<CreateSurveyScheduleUseCase>(),
        Get.find<ApproveSurveyScheduleUseCase>(),
        Get.find<RejectSurveyScheduleUseCase>(),
        Get.find<RescheduleSurveyUseCase>(),
        Get.find<CompleteSurveyUseCase>(),
        Get.find<UploadContractUseCase>(),
        Get.find<GetContractUseCase>(),
        Get.find<ApproveContractUseCase>(),
        Get.find<AskContractRevisionUseCase>(),
        Get.find<GenerateContractDraftUseCase>(),
        Get.find<UploadFinalDocumentsUseCase>(),
        Get.find<ApproveFinalDocumentsUseCase>(),
        Get.find<RejectFinalDocumentsUseCase>(),
        Get.find<DownloadFileUseCase>(),
      );
    });
  }
}
