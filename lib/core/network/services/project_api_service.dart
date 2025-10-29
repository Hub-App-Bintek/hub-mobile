// Retrofit API service for project-related endpoints.
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';

part 'project_api_service.g.dart';

@RestApi()
abstract class ProjectApiService {
  factory ProjectApiService(Dio dio, {String? baseUrl}) = _ProjectApiService;

  @POST(ApiEndpoints.projects)
  Future<CreateProjectResponse> createProject(
    @Body() CreateProjectRequest body,
  );

  @GET(ApiEndpoints.projects)
  Future<GetProjectsResponse> getProjects(
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('type') String? type,
    @Query('status') String? status,
  );

  // New: Get project details by ID
  @GET('${ApiEndpoints.projects}/{projectId}')
  Future<ProjectDetailsResponse> getProjectDetail(
    @Path('projectId') String projectId,
  );
}
