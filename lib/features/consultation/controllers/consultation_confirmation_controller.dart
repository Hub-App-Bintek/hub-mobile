import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class ConsultationConfirmationController extends BaseController {
  final RxString selectedSurveyOption = 'Tidak perlu survey'.obs;

  final List<String> surveyOptions = const [
    'Tidak perlu survey',
    'Perlu survey',
  ];

  void onSurveyOptionChanged(String? value) {
    if (value == null || value.isEmpty) return;
    selectedSurveyOption.value = value;
  }

  void onAccept() {
    // TODO: hook into accept flow
  }

  void onReject() {
    // TODO: hook into reject flow
  }
}
