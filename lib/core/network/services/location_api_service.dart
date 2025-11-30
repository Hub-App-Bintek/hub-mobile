import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:retrofit/retrofit.dart';

part 'location_api_service.g.dart';

@RestApi()
abstract class LocationApiService {
  factory LocationApiService(Dio dio, {String? baseUrl}) = _LocationApiService;

  @GET(ApiEndpoints.locationsProvince)
  Future<List<Province>> getProvinces();

  @GET(ApiEndpoints.locationsRegency)
  Future<List<Regency>> getRegencies(@Path('provinceId') int provinceId);

  @GET(ApiEndpoints.locationsDistrict)
  Future<List<District>> getDistricts(@Path('regencyId') int regencyId);

  @GET(ApiEndpoints.locationsVillage)
  Future<List<Village>> getVillages(@Path('districtId') int districtId);
}
