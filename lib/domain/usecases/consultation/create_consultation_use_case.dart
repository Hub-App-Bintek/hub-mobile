// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/consultation/create_consultation_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

class CreateConsultationUseCase
    extends UseCase<CreateConsultationResponse, CreateConsultationRequest> {
  final ConsultationRepository _repository;

  CreateConsultationUseCase(this._repository);

  @override
  Future<Result<CreateConsultationResponse, Failure>> call(
    CreateConsultationRequest request,
  ) {
    return _repository.createConsultation(request);
  }
}
