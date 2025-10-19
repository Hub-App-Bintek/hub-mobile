import 'package:freezed_annotation/freezed_annotation.dart';
import '../consultant.dart';
import '../portfolio.dart';

part 'portfolio_response.freezed.dart';
part 'portfolio_response.g.dart';

@freezed
class PortfolioResponse with _$PortfolioResponse {
  const factory PortfolioResponse({
    required Consultant consultant,
    required List<Portfolio> portfolios,
  }) = _PortfolioResponse;

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioResponseFromJson(json);
}
