import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:retrofit/retrofit.dart';

part 'project_api_service.g.dart';

@RestApi()
abstract class ProjectApiService {
  factory ProjectApiService(Dio dio, {String? baseUrl}) = _ProjectApiService;

  @MultiPart()
  @POST(ApiEndpoints.projectsV1)
  Future<CreateProjectResponse> createProject(@Body() FormData body);

  @GET(ApiEndpoints.projectDetailV2)
  Future<ProjectDetailsResponse> getProjectV2(
    @Path('projectId') String projectId,
  );
}
