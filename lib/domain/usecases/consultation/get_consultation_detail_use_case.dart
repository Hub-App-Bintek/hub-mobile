// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/consultation/get_consultation_detail_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class GetConsultationDetailUseCase extends UseCase<Consultation, String> {
  final ConsultationRepository _repository;

  GetConsultationDetailUseCase(this._repository);

  @override
  Future<Result<Consultation, Failure>> call(String consultationId) {
    return _repository.getConsultationDetail(consultationId);
  }
}
