// Retrofit API service for project-related endpoints.
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';

part 'project_api_service.g.dart';

@RestApi()
abstract class ProjectApiService {
  factory ProjectApiService(Dio dio, {String? baseUrl}) = _ProjectApiService;

  @POST(ApiEndpoints.createProject)
  Future<CreateProjectResponse> createProject(
    @Body() CreateProjectRequest body,
  );
}

