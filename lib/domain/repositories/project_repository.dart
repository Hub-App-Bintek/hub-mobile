import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';

abstract class ProjectRepository {
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

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectNetworkDataSource _dataSource;

  ProjectRepositoryImpl(this._dataSource);

  @override
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request,
  ) {
    return _dataSource.createProject(request);
  }

  @override
  Future<Result<GetProjectsResponse, Failure>> getProjectList(
    GetProjectsRequest request,
  ) {
    return _dataSource.getProjectList(request);
  }

  @override
  Future<Result<ProjectDetailsResponse, Failure>> getProjectDetail(
    String projectId,
  ) {
    return _dataSource.getProjectDetail(projectId);
  }
}
