import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class LicensingController extends BaseController {
  final RxInt selectedConsultationIndex = (-1).obs;

  final List<ConsultationSummary> consultations = const [
    ConsultationSummary(
      title: 'Renovasi Rumah Type 45',
      dateLabel: '20 Nov 2025',
      location: 'DKI Jakarta',
    ),
    ConsultationSummary(
      title: 'Pembangunan Rumah 2 Lantai',
      dateLabel: '18 Nov 2025',
      location: 'Jawa Barat',
    ),
    ConsultationSummary(
      title: 'Renovasi Dapur Modern',
      dateLabel: '15 Nov 2025',
      location: 'DKI Jakarta',
    ),
  ];

  void selectConsultation(int index) {
    selectedConsultationIndex.value = index;
  }
}

class ConsultationSummary {
  const ConsultationSummary({
    required this.title,
    required this.dateLabel,
    required this.location,
  });

  final String title;
  final String dateLabel;
  final String location;
}
