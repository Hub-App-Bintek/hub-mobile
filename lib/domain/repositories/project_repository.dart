import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';

abstract class ProjectRepository {
  Future<Result<CreateProjectResponse, Failure>> createProject(CreateProjectRequest request);
}

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectNetworkDataSource _dataSource;

  ProjectRepositoryImpl(this._dataSource);

  @override
  Future<Result<CreateProjectResponse, Failure>> createProject(CreateProjectRequest request) {
    return _dataSource.createProject(request);
  }
}
