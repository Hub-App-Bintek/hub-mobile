import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/location/location_network_data_source.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';

abstract class LocationRepository {
  Future<Result<List<Province>, Failure>> getProvinces();
  Future<Result<List<Regency>, Failure>> getRegencies(int provinceId);
  Future<Result<List<District>, Failure>> getDistricts(int regencyId);
  Future<Result<List<Village>, Failure>> getVillages(int districtId);
}

class LocationRepositoryImpl implements LocationRepository {
  final LocationNetworkDataSource _dataSource;

  LocationRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Province>, Failure>> getProvinces() {
    return _dataSource.getProvinces();
  }

  @override
  Future<Result<List<Regency>, Failure>> getRegencies(int provinceId) {
    return _dataSource.getRegencies(provinceId);
  }

  @override
  Future<Result<List<District>, Failure>> getDistricts(int regencyId) {
    return _dataSource.getDistricts(regencyId);
  }

  @override
  Future<Result<List<Village>, Failure>> getVillages(int districtId) {
    return _dataSource.getVillages(districtId);
  }
}
