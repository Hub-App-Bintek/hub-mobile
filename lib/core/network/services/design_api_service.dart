import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:retrofit/retrofit.dart';

part 'design_api_service.g.dart';

@RestApi()
abstract class DesignApiService {
  factory DesignApiService(Dio dio, {String? baseUrl}) = _DesignApiService;

  @GET(ApiEndpoints.prototypeDesigns)
  Future<List<PrototypeDesign>> getPrototypeDesigns();

  @GET(ApiEndpoints.prototypeDesignById)
  Future<PrototypeDesign> getPrototypeDesignById(@Path('id') String id);

  // Download prototype design files as ZIP.
  @DioResponseType(ResponseType.bytes)
  @GET(ApiEndpoints.prototypeDesignDownload)
  Future<HttpResponse<List<int>>> downloadPrototypeDesign(
    @Path('id') String id,
  );
}
