import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_portfolio_request.freezed.dart';
part 'save_portfolio_request.g.dart';

@freezed
class SavePortfolioRequest with _$SavePortfolioRequest {
  const factory SavePortfolioRequest({
    String? bio,
    String? specialization,
    String? experience,
    String? education,
    String? certifications,
    String? projectSamples,
    String? linkedinUrl,
    String? websiteUrl,
  }) = _SavePortfolioRequest;

  factory SavePortfolioRequest.fromJson(Map<String, dynamic> json) => _$SavePortfolioRequestFromJson(json);
}

