import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetMonitoringDocumentsUseCase implements UseCase<List<MonitoringDocumentModel>, int> {
  final MonitoringRepository _repository;

  GetMonitoringDocumentsUseCase(this._repository);

  @override
  Future<Result<List<MonitoringDocumentModel>, Failure>> call(int monitoringId) {
    return _repository.getDocuments(monitoringId);
  }
}
