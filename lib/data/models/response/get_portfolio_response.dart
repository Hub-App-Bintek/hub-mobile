import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_portfolio_response.freezed.dart';
part 'get_portfolio_response.g.dart';

@freezed
class GetPortfolioResponse with _$GetPortfolioResponse {
  const factory GetPortfolioResponse({
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
  }) = _GetPortfolioResponse;

  factory GetPortfolioResponse.fromJson(Map<String, dynamic> json) => _$GetPortfolioResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String email,
    String? name,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

