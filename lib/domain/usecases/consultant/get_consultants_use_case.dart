import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';

class GetConsultantsParams {
  const GetConsultantsParams({
    required this.lat,
    required this.long,
    required this.page,
    required this.size,
    required this.type,
    this.sortBy,
  });

  final double lat;
  final double long;
  final int page;
  final int size;
  final String type;
  final String? sortBy;
}

class GetConsultantsUseCase
    extends UseCase<ConsultantsResponse, GetConsultantsParams> {
  final ConsultantRepository _repository;

  GetConsultantsUseCase(this._repository);

  @override
  Future<Result<ConsultantsResponse, Failure>> call(
    GetConsultantsParams params,
  ) {
    return _repository.getConsultants(
      lat: params.lat,
      long: params.long,
      page: params.page,
      size: params.size,
      type: params.type,
      sortBy: params.sortBy,
    );
  }
}
