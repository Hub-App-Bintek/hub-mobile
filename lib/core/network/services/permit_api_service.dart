// lib/core/network/services/permit_api_service.dart

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/submit_simbg_request.dart';
import 'package:pkp_hub/data/models/response/permit_status_response.dart';

// Import the new response model
import 'package:pkp_hub/data/models/response/submit_simbg_response.dart';
import 'package:retrofit/retrofit.dart';

part 'permit_api_service.g.dart';

@RestApi()
abstract class PermitApiService {
  factory PermitApiService(Dio dio, {String baseUrl}) = _PermitApiService;

  // Change the return type from Future<void> to Future<SubmitSimbgResponse>
  @POST(ApiEndpoints.submitPermit)
  Future<SubmitSimbgResponse> submitSimbgForm(
      @Path("projectId") String projectId,
      @Body() SubmitSimbgRequest request,);

  @GET('${ApiEndpoints.statusPermit}/{projectId}/status')
  Future<PermitStatusResponse> getPermitStatus(
      @Path("projectId") String projectId,
      );
}