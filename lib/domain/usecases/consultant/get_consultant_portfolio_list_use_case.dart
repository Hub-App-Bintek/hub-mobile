import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/response/portfolio_response.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';

class GetConsultantPortfolioListUseCase {
  final ConsultantRepository _repository;

  GetConsultantPortfolioListUseCase(this._repository);

  Future<Result<PortfolioResponse, Failure>> call({
    required String consultantId,
    int? page,
    int? size,
  }) {
    return _repository.getConsultantPortfolios(
      consultantId: consultantId,
      page: page,
      size: size,
    );
  }
}
