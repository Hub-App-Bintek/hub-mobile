import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import 'monitoring_detail_controller.dart';

class ReportDetailController extends BaseController {
  late final ReportItem report;

  @override
  void onInit() {
    super.onInit();
    report = Get.arguments as ReportItem;
  }
}
