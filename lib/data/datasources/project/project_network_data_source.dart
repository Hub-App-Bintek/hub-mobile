import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/project_api_service.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';

/// Obsolete, remove it later
abstract class ProjectNetworkDataSource {
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request, {
    File? incomeProofFile,
  });

  Future<Result<ProjectDetailsResponse, Failure>> getProjectV2(
    String projectId,
  );
}

/// Obsolete, remove it later
class ProjectNetworkDataSourceImpl implements ProjectNetworkDataSource {
  final ApiClient _apiClient;
  final ProjectApiService _projectApi;

  ProjectNetworkDataSourceImpl(this._apiClient, this._projectApi);

  @override
  Future<Result<CreateProjectResponse, Failure>> createProject(
    CreateProjectRequest request, {
    File? incomeProofFile,
  }) async {
    try {
      final formData = FormData.fromMap(request.toJson());

      if (incomeProofFile != null) {
        formData.files.add(
          MapEntry(
            'file',
            await MultipartFile.fromFile(
              incomeProofFile.path,
              filename: incomeProofFile.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }

      final response = await _projectApi.createProject(formData);
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
  Future<Result<ProjectDetailsResponse, Failure>> getProjectV2(
    String projectId,
  ) async {
    try {
      final res = await _projectApi.getProjectV2(projectId);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse project detail: $e'),
      );
    }
  }
}
