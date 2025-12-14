import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_report_detail_usecase.dart';

class ReportDetailController extends BaseController {
  final GetReportDetailUseCase _getReportDetailUseCase;

  ReportDetailController(this._getReportDetailUseCase);

  final reportDetail = Rxn<ReportDetailModel>();
  final isLoading = false.obs;
  late final int _reportId;

  @override
  void onInit() {
    super.onInit();
    // Safely get the reportId from arguments
    final arg = Get.arguments;
    if (arg is int) {
      _reportId = arg;
    } else {
      // Fallback or error if argument is wrong type
      Get.back();
      Get.snackbar('Error', 'ID Laporan tidak valid.');
      return;
    }
    fetchReportDetail();
  }

  Future<void> fetchReportDetail() async {
    isLoading.value = true;
    await handleAsync(
          () => _getReportDetailUseCase(GetReportDetailParams(reportId: _reportId)),
      onSuccess: (result) {
        reportDetail.value = result;
        isLoading.value = false;
      },
      // BaseController's handleAsync will show a generic error on failure
    );
  }
}
