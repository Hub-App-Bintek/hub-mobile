import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultant_on_portfolios.freezed.dart';
part 'consultant_on_portfolios.g.dart';

@freezed
class ConsultantOnPortfolios with _$ConsultantOnPortfolios {
  const factory ConsultantOnPortfolios({
    required int? id,
    required String? name,
    required String? email,
    required String? specialization,
  }) = _ConsultantOnPortfolios;

  factory ConsultantOnPortfolios.fromJson(Map<String, dynamic> json) =>
      _$ConsultantOnPortfoliosFromJson(json);
}
