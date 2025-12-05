import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/data/datasources/project/project_network_data_source.dart';

abstract class ProjectRepository {
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request, {
    File? incomeProofFile,
  });

  Future<Result<ProjectDetailsResponse, Failure>> getProjectV2(
    String projectId,
  );
}

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectNetworkDataSource _dataSource;

  ProjectRepositoryImpl(this._dataSource);

  @override
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request, {
    File? incomeProofFile,
  }) {
    return _dataSource.createProject(request, incomeProofFile: incomeProofFile);
  }

  @override
  Future<Result<ProjectDetailsResponse, Failure>> getProjectV2(
    String projectId,
  ) {
    return _dataSource.getProjectV2(projectId);
  }
}
