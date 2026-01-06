import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/portfolio.dart';
import 'package:pkp_hub/data/models/response/consultant_on_portfolios.dart';

part 'consultant_portfolios_response.freezed.dart';
part 'consultant_portfolios_response.g.dart';

@freezed
class ConsultantPortfoliosResponse with _$ConsultantPortfoliosResponse {
  const factory ConsultantPortfoliosResponse({
    required ConsultantOnPortfolios? consultant,
    required List<Portfolio>? portfolios,
  }) = _ConsultantPortfoliosResponse;

  factory ConsultantPortfoliosResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultantPortfoliosResponseFromJson(json);
}
