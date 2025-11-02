import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:retrofit/retrofit.dart';

part 'contract_api_service.g.dart';

@RestApi()
abstract class ContractApiService {
  factory ContractApiService(Dio dio, {String? baseUrl}) = _ContractApiService;

  @GET(ApiEndpoints.contractByConsultation)
  Future<Contract> getContract(@Path('consultationId') String consultationId);

  @MultiPart()
  @POST(ApiEndpoints.contractCreateDraft)
  Future<UploadContractResponse> createDraft(
    @Path('consultationId') String consultationId,
    @Part(name: 'request', contentType: 'application/json') String requestJson,
    @Part(name: 'file') File file,
  );

  @DioResponseType(ResponseType.bytes)
  @POST(ApiEndpoints.contractGenerateDraft)
  Future<HttpResponse<List<int>>> generateDraft(
    @Path('consultationId') String consultationId,
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiEndpoints.contractRequestApproval)
  Future<Contract> requestApproval(@Path('contractId') String contractId);

  @POST(ApiEndpoints.contractApprove)
  Future<Contract> approve(@Path('contractId') String contractId);

  @POST(ApiEndpoints.contractRejectPost)
  Future<Contract> rejectPost(
    @Path('contractId') String contractId,
    @Query('reason') String reason,
  );

  @POST(ApiEndpoints.contractRequestRevision)
  Future<Contract> requestRevision(
    @Path('contractId') String contractId,
    @Query('revisionNotes') String? revisionNotes,
  );

  @PATCH(ApiEndpoints.contractSign)
  Future<Contract> signContract(@Path('contractId') String contractId);
}
