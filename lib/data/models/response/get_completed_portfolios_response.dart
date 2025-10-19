import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_completed_portfolios_response.freezed.dart';
part 'get_completed_portfolios_response.g.dart';

@freezed
class GetCompletedPortfoliosResponse with _$GetCompletedPortfoliosResponse {
  const factory GetCompletedPortfoliosResponse({
    required List<PortfolioData> portfolios,
  }) = _GetCompletedPortfoliosResponse;

  factory GetCompletedPortfoliosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCompletedPortfoliosResponseFromJson(json);
}

@freezed
class PortfolioData with _$PortfolioData {
  const factory PortfolioData({
    required int id,
    required UserData user,
    String? bio,
    String? specialization,
    String? experience,
    String? education,
    String? certifications,
    String? projectSamples,
    String? linkedinUrl,
    String? websiteUrl,
  }) = _PortfolioData;

  factory PortfolioData.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String email,
    String? name,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
