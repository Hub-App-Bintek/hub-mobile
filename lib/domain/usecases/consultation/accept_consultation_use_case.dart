import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/accept_consultation_request.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class AcceptConsultationPayload {
  AcceptConsultationPayload({
    required this.consultationId,
    required this.request,
  });

  final String consultationId;
  final AcceptConsultationRequest request;
}

class AcceptConsultationUseCase
    extends UseCase<Consultation, AcceptConsultationPayload> {
  AcceptConsultationUseCase(this._repository);

  final ConsultationRepository _repository;

  @override
  Future<Result<Consultation, Failure>> call(AcceptConsultationPayload params) {
    return _repository.acceptConsultation(
      params.consultationId,
      params.request,
    );
  }
}
