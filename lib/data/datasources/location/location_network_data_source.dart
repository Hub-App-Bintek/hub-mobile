import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/location_api_service.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';

abstract class LocationNetworkDataSource {
  Future<Result<List<Province>, Failure>> getProvinces();
  Future<Result<List<Regency>, Failure>> getRegencies(int provinceId);
  Future<Result<List<District>, Failure>> getDistricts(int regencyId);
  Future<Result<List<Village>, Failure>> getVillages(int districtId);
}

class LocationNetworkDataSourceImpl implements LocationNetworkDataSource {
  final ApiClient _apiClient;
  final LocationApiService _locationApi;

  LocationNetworkDataSourceImpl(this._apiClient, this._locationApi);

  @override
  Future<Result<List<Province>, Failure>> getProvinces() async {
    try {
      final provinces = await _locationApi.getProvinces();
      return Success(provinces);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch provinces: $e'));
    }
  }

  @override
  Future<Result<List<Regency>, Failure>> getRegencies(int provinceId) async {
    try {
      final regencies = await _locationApi.getRegencies(provinceId);
      return Success(regencies);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch regencies: $e'));
    }
  }

  @override
  Future<Result<List<District>, Failure>> getDistricts(int regencyId) async {
    try {
      final districts = await _locationApi.getDistricts(regencyId);
      return Success(districts);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch districts: $e'));
    }
  }

  @override
  Future<Result<List<Village>, Failure>> getVillages(int districtId) async {
    try {
      final villages = await _locationApi.getVillages(districtId);
      return Success(villages);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch villages: $e'));
    }
  }
}
