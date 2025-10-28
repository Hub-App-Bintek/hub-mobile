import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';

abstract class ProjectNetworkDataSource {
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request,
  );

  Future<Result<GetProjectsResponse, Failure>> getProjectList(
    GetProjectsRequest request,
  );

  Future<Result<ProjectDetailsResponse, Failure>> getProjectDetail(
    String projectId,
  );
}

class ProjectNetworkDataSourceImpl implements ProjectNetworkDataSource {
  final ApiClient _apiClient;
  final ProjectApiService _projectApi;

  ProjectNetworkDataSourceImpl(this._apiClient, this._projectApi);

  @override
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request,
  ) async {
    try {
      final response = await _projectApi.createProject(request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse create project response: $e'),
      );
    }
  }

  @override
  Future<Result<GetProjectsResponse, Failure>> getProjectList(
    GetProjectsRequest request,
  ) async {
    try {
      final response = await _projectApi.getProjects(
        request.page ?? 0,
        request.size ?? 10,
        request.type,
        request.status,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse get projects response: $e'),
      );
    }
  }

  @override
  Future<Result<ProjectDetailsResponse, Failure>> getProjectDetail(
    String projectId,
  ) async {
    try {
      final response = await _projectApi.getProjectDetail(projectId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse get project details response: $e',
        ),
      );
    }
  }
}
