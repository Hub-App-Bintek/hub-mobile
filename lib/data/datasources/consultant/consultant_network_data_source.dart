import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/consultant_api_service.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';

abstract class ConsultantNetworkDataSource {
  Future<Result<ConsultantsResponse, Failure>> getConsultants({
    required double lat,
    required double long,
    required int page,
    required int size,
    required String type,
    String? sortBy,
  });
  Future<Result<ConsultantPortfoliosResponse, Failure>>
  getConsultantPortfolios({required String consultantId, int? page, int? size});
}

class ConsultantNetworkDataSourceImpl implements ConsultantNetworkDataSource {
  final ApiClient _apiClient;
  final ConsultantApiService _consultantApi;

  ConsultantNetworkDataSourceImpl(this._apiClient, this._consultantApi);

  @override
  Future<Result<ConsultantsResponse, Failure>> getConsultants({
    required double lat,
    required double long,
    required int page,
    required int size,
    required String type,
    String? sortBy,
  }) async {
    try {
      final res = await _consultantApi.getConsultants(
        lat: lat,
        long: long,
        page: page,
        size: size,
        type: type,
        sortBy: sortBy,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse consultants response: $e'),
      );
    }
  }

  @override
  Future<Result<ConsultantPortfoliosResponse, Failure>>
  getConsultantPortfolios({
    required String consultantId,
    int? page,
    int? size,
  }) async {
    try {
      final res = await _consultantApi.getConsultantPortfolio(
        consultantId,
        page: page,
        size: size,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse consultation portfolios response: $e',
        ),
      );
    }
  }
}
