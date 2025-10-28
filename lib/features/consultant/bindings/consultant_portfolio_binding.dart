import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';

import '../controllers/consultant_portfolios_controller.dart';

class ConsultantPortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantPortfoliosUseCase>(
      () => GetConsultantPortfoliosUseCase(Get.find<ConsultantRepository>()),
    );

    // Register create consultation use case
    Get.lazyPut<CreateConsultationUseCase>(
      () => CreateConsultationUseCase(Get.find<ConsultationRepository>()),
    );

    Get.lazyPut<ConsultantPortfoliosController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      return ConsultantPortfoliosController(
        args?['consultantId'] ?? '',
        args?['projectId'] ?? '',
        args?['isPaidConsultation'] ?? false,
        Get.find<UserStorage>(),
        Get.find<GetConsultantPortfoliosUseCase>(),
        Get.find<CreateConsultationUseCase>(),
      );
    });
  }
}
