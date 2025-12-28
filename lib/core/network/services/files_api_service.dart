import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/file_upload_response.dart';
import 'package:retrofit/retrofit.dart';

part 'files_api_service.g.dart';

@RestApi()
abstract class FilesApiService {
  factory FilesApiService(Dio dio, {String? baseUrl}) = _FilesApiService;

  @MultiPart()
  @POST(ApiEndpoints.filesUpload)
  Future<dynamic> upload(
    @Part(name: 'category') String category,
    @Part(name: 'subCategory') String subCategory,
    @Part(name: 'entityId') String entityId,
    @Part(name: 'file') File file,
  );

  @POST(ApiEndpoints.filesUpload)
  @MultiPart()
  Future<FileUploadResponse> uploadFile({
    @Part() required String category,
    @Part() String? subCategory,
    @Part() required String entityId,
    @Part() required File file,
  });

  // Download a file by its id. Returns raw bytes in the HTTP response.
  @DioResponseType(ResponseType.stream)
  @GET(ApiEndpoints.filesDownload)
  Future<HttpResponse<List<int>>> downloadFile(@Path('fileId') String fileId);
}
