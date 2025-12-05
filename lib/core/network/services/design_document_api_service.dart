import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
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
  Future<void> approveDesignDocuments(
    @Path('designDocumentId') String designDocumentId,
  );

  @POST(ApiEndpoints.designDocumentsRevisionRequest)
  Future<void> requestDesignRevision(
    @Path('designDocumentId') String designDocumentId,
    @Body() Map<String, dynamic> body,
  );
}
