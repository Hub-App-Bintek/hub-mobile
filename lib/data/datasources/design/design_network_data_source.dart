import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/design_api_service.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:retrofit/dio.dart';

abstract class DesignNetworkDataSource {
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns();
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(String id);
  Future<Result<HttpResponse<List<int>>, Failure>> downloadPrototypeDesign(
    String id,
  );
}

class DesignNetworkDataSourceImpl implements DesignNetworkDataSource {
  final ApiClient _apiClient;
  final DesignApiService _designApi;
  DesignNetworkDataSourceImpl(this._apiClient, this._designApi);

  @override
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns() async {
    try {
      final response = await _designApi.getPrototypeDesigns();
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse prototype designs: $e'),
      );
    }
  }

  @override
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(
    String id,
  ) async {
    try {
      final response = await _designApi.getPrototypeDesignById(id);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to fetch prototype design: $e'),
      );
    }
  }

  @override
  Future<Result<HttpResponse<List<int>>, Failure>> downloadPrototypeDesign(
    String id,
  ) async {
    try {
      final response = await _designApi.downloadPrototypeDesign(id);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to download prototype design: $e'),
      );
    }
  }
}
