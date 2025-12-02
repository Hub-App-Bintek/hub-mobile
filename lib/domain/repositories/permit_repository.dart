// lib/domain/repositories/permit_repository.dart

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/permit/permit_remote_data_source.dart';
import 'package:pkp_hub/data/models/request/submit_simbg_request.dart';
import 'package:pkp_hub/data/models/response/permit_status_response.dart';

// Import the response model to use in the return type
import 'package:pkp_hub/data/models/response/submit_simbg_response.dart';

abstract class PermitRepository {
  // Update the return type from Result<void, Failure> to Result<SubmitSimbgResponse, Failure>
  Future<Result<SubmitSimbgResponse, Failure>> submitSimbgForm({
    required String projectId,
    required SubmitSimbgRequest request,
  });

  Future<Result<PermitStatusResponse, Failure>> getPermitStatus({
    required String projectId,
  });
}

class PermitRepositoryImpl implements PermitRepository {
  final PermitRemoteDataSource _remoteDataSource;

  PermitRepositoryImpl(this._remoteDataSource);

  // Update the implementation to match the new abstract signature
  @override
  Future<Result<SubmitSimbgResponse, Failure>> submitSimbgForm({
    required String projectId,
    required SubmitSimbgRequest request,
  }) async {
    // The remote data source now returns the correct type, so we can just return its result.
    // The previous `try/catch` logic here was redundant as it's already handled in the datasource.
    return _remoteDataSource.submitSimbgForm(
      projectId: projectId,
      request: request,
    );
  }

  // --- IMPLEMENTATION OF THE NEW METHOD ---
  @override
  Future<Result<PermitStatusResponse, Failure>> getPermitStatus({
    required String projectId,
  }) {
    // Delegate the call directly to the remote data source.
    // The data source is responsible for handling try/catch and error mapping.
    return _remoteDataSource.getPermitStatus(projectId: projectId);
  }
}
