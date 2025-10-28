import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';

class GetConsultantPortfoliosUseCase
    extends
        UseCaseQueryParams<
          ConsultantPortfoliosResponse,
          ConsultantPortfoliosQueryParams
        > {
  final ConsultantRepository _repository;

  GetConsultantPortfoliosUseCase(this._repository);

  @override
  Future<Result<ConsultantPortfoliosResponse, Failure>> call(
    ConsultantPortfoliosQueryParams queryParams,
  ) {
    return _repository.getConsultantPortfolios(
      consultantId: queryParams.consultantId,
      page: queryParams.page,
      size: queryParams.size,
    );
  }

  // @override
  // Future<Result<ConsultantPortfoliosResponse, Failure>> call({
  //   required String consultantId,
  //   int? page,
  //   int? size,
  // }) {
  //   return _repository.getConsultantPortfolios(
  //     consultantId: consultantId,
  //     page: page,
  //     size: size,
  //   );
  // }
}

class ConsultantPortfoliosQueryParams extends QueryParams {
  final String consultantId;
  final int? page;
  final int? size;

  ConsultantPortfoliosQueryParams({
    required this.consultantId,
    this.page,
    this.size,
  });

  @override
  Map<String, String> toQuery() {
    final query = <String, String>{'consultantId': consultantId};
    if (page != null) query['page'] = page.toString();
    if (size != null) query['size'] = size.toString();
    return query;
  }
}
