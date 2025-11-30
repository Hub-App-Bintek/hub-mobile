import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class LicensingStep {
  LicensingStep({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isCompleted,
  });

  final String title;
  final String subtitle;
  final String date;
  final bool isCompleted;
}

enum LicensingStage { documents, status, result }

class LicensingDetailsController extends BaseController {
  final RxString licenseNumber = 'PKP-PL-23001'.obs;
  final RxString projectName = 'Perizinan Bangunan Rumah Tinggal'.obs;
  final RxString address =
      'Jl. Mawar No. 21, Kebayoran Lama, Jakarta Selatan'.obs;
  final Rx<LicensingStage> selectedStage = LicensingStage.documents.obs;
  final RxBool hasSupportingDocument = false.obs;
  final RxList<LicensingStep> steps = <LicensingStep>[
    LicensingStep(
      title: 'Pengajuan',
      subtitle: 'Dokumen pengajuan telah dikirim',
      date: '12 Jan 2025',
      isCompleted: true,
    ),
    LicensingStep(
      title: 'Verifikasi',
      subtitle: 'Dokumen sedang diverifikasi',
      date: '13 Jan 2025',
      isCompleted: true,
    ),
    LicensingStep(
      title: 'Proses',
      subtitle: 'Permohonan sedang diproses',
      date: '14 Jan 2025',
      isCompleted: false,
    ),
    LicensingStep(
      title: 'Selesai',
      subtitle: 'Perizinan diterbitkan',
      date: '-',
      isCompleted: false,
    ),
  ].obs;

  void selectStage(LicensingStage stage) {
    if (selectedStage.value == stage) return;
    selectedStage.value = stage;
  }
}
