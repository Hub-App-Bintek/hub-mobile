import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_portfolio_response.freezed.dart';
part 'save_portfolio_response.g.dart';

@freezed
class SavePortfolioResponse with _$SavePortfolioResponse {
  const factory SavePortfolioResponse({
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
  }) = _SavePortfolioResponse;

  factory SavePortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$SavePortfolioResponseFromJson(json);
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
