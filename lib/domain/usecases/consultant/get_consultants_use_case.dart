import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';

class GetConsultantsUseCase {
  final ConsultantRepository repository;

  GetConsultantsUseCase(this.repository);

  Future<Result<ConsultantsResponse, Failure>> call({
    required double lat,
    required double long,
    required int page,
    required int size,
    String? type,
    String? specialty,
    String? sortBy,
  }) {
    return repository.getConsultants(
      lat: lat,
      long: long,
      page: page,
      size: size,
      type: type,
      specialty: specialty,
      sortBy: sortBy,
    );
  }
}
