import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetReportDetailUseCase
    implements UseCase<ReportDetailModel, GetReportDetailParams> {
  final MonitoringRepository _repository;

  GetReportDetailUseCase(this._repository);

  @override
  Future<Result<ReportDetailModel, Failure>> call(GetReportDetailParams params) {
    return _repository.getReportDetail(reportId: params.reportId);
  }
}

class GetReportDetailParams {
  final int reportId;

  GetReportDetailParams({required this.reportId});
}
