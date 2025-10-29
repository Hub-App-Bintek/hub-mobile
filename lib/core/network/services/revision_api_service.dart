import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/create_revision_request.dart';
import 'package:pkp_hub/data/models/revision.dart';
import 'package:retrofit/retrofit.dart';

part 'revision_api_service.g.dart';

@RestApi()
abstract class RevisionApiService {
  factory RevisionApiService(Dio dio, {String? baseUrl}) = _RevisionApiService;

  @POST(ApiEndpoints.revisions)
  Future<Revision> createRevision(
    @Query('consultationId') String consultationId,
    @Body() CreateRevisionRequest body,
  );

  @GET(ApiEndpoints.revisions)
  Future<List<Revision>> getRevisions(
    @Query('consultationId') String consultationId,
  );
}
