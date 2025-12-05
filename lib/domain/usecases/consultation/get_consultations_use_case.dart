import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class GetConsultationsUseCase
    extends UseCase<ConsultationsResponse, GetConsultationsParams> {
  final ConsultationRepository _repository;

  GetConsultationsUseCase(this._repository);

  @override
  Future<Result<ConsultationsResponse, Failure>> call(
    GetConsultationsParams params,
  ) {
    return _repository.getConsultations(
      status: params.status,
      page: params.page,
    );
  }
}

class GetConsultationsParams {
  const GetConsultationsParams({this.status, this.page});

  final String? status;
  final int? page;
}
