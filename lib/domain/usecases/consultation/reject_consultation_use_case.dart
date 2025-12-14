import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class RejectConsultationUseCase extends UseCase<Consultation, String> {
  RejectConsultationUseCase(this._repository);

  final ConsultationRepository _repository;

  @override
  Future<Result<Consultation, Failure>> call(String consultationId) {
    return _repository.rejectConsultation(consultationId);
  }
}
