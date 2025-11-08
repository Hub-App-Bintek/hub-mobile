// Retrofit API service for user-related endpoints.
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';
import 'package:retrofit/retrofit.dart';

part 'consultant_api_service.g.dart';

@RestApi()
abstract class ConsultantApiService {
  factory ConsultantApiService(Dio dio, {String? baseUrl}) =
      _ConsultantApiService;

  @GET(ApiEndpoints.consultants)
  Future<ConsultantsResponse> getConsultants({
    @Query('lat') required double lat,
    @Query('long') required double long,
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('type') String? type,
    @Query('specialty') String? specialty,
    @Query('sortBy') String? sortBy,
  });

  @GET(ApiEndpoints.consultantPortfolio)
  Future<ConsultantPortfoliosResponse> getConsultantPortfolio(
    @Path('consultantId') String consultantId, {
    @Query('page') int? page,
    @Query('size') int? size,
  });
}
