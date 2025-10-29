import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/final_document.dart';
import 'package:retrofit/retrofit.dart';

part 'final_document_api_service.g.dart';

@RestApi()
abstract class FinalDocumentApiService {
  factory FinalDocumentApiService(Dio dio, {String? baseUrl}) =
      _FinalDocumentApiService;

  @POST(ApiEndpoints.finalDocuments)
  Future<FinalDocument> uploadFinalDocuments(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.finalDocumentsApprove)
  Future<void> approveFinalDocuments(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.finalDocumentsReject)
  Future<void> rejectFinalDocuments(
    @Path('consultationId') String consultationId,
    @Body() Map<String, dynamic> body,
  );
}
