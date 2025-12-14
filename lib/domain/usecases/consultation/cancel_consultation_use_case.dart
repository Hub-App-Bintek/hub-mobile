import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/cancel_consultation_request.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class CancelConsultationParams {
  CancelConsultationParams({
    required this.consultationId,
    required this.reason,
  });

  final String consultationId;
  final String reason;
}

class CancelConsultationUseCase
    extends UseCase<Consultation, CancelConsultationParams> {
  CancelConsultationUseCase(this._repository);

  final ConsultationRepository _repository;

  @override
  Future<Result<Consultation, Failure>> call(CancelConsultationParams params) {
    return _repository.cancelConsultation(
      params.consultationId,
      CancelConsultationRequest(reason: params.reason),
    );
  }
}
