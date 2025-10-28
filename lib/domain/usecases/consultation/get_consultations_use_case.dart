// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/consultation/get_consultations_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class GetConsultationsUseCase extends UseCaseNoParams<List<Consultation>> {
  final ConsultationRepository _repository;

  GetConsultationsUseCase(this._repository);

  @override
  Future<Result<List<Consultation>, Failure>> call() {
    return _repository.getConsultations();
  }
}
