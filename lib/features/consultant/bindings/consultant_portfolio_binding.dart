import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';

import '../controllers/consultant_portfolio_controller.dart';

class ConsultantPortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantPortfolioListUseCase>(
      () => GetConsultantPortfolioListUseCase(Get.find()),
    );

    Get.lazyPut<ConsultantPortfolioController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      return ConsultantPortfolioController(
        args?['consultantId'] ?? '',
        Get.find<GetConsultantPortfolioListUseCase>(),
      );
    });
  }
}
