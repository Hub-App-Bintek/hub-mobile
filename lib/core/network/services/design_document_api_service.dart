import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/approve_design_request.dart';
import 'package:pkp_hub/data/models/request/design_document_revision_request.dart';
import 'package:pkp_hub/data/models/response/design_document_approval_response.dart';
import 'package:pkp_hub/data/models/response/design_document_revision_response.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';
import 'package:retrofit/retrofit.dart';

part 'design_document_api_service.g.dart';

@RestApi()
abstract class DesignDocumentApiService {
  factory DesignDocumentApiService(Dio dio, {String? baseUrl}) =
      _DesignDocumentApiService;

  @MultiPart()
  @POST(ApiEndpoints.designDocumentsUpload)
  Future<UploadDesignDocumentResponse> uploadDesignDocuments(
    @Part(name: 'consultationId') String consultationId,
    @Part(name: 'fileDed') File fileDed,
    @Part(name: 'fileRab') File fileRab,
    @Part(name: 'fileBoq') File fileBoq,
  );

  @POST(ApiEndpoints.designDocumentsApprove)
  Future<DesignDocumentApprovalResponse> approveDesignDocuments(
    @Path('designDocumentId') String designDocumentId,
    @Body() ApproveDesignRequest body,
  );

  @POST(ApiEndpoints.designDocumentsRevisionRequest)
  Future<DesignDocumentRevisionResponse> requestDesignRevision(
    @Path('consultationId') String consultationId,
    @Body() DesignDocumentRevisionRequest body,
  );

  @DioResponseType(ResponseType.stream)
  @GET(ApiEndpoints.designDocumentsVersionDownload)
  Future<HttpResponse<List<int>>> downloadVersionZip(
    @Path('version') String version,
    @Query('consultationId') String consultationId,
  );
}
