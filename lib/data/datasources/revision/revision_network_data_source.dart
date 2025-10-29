// Revision network data source for creating and fetching revisions
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/revision_api_service.dart';
import 'package:pkp_hub/data/models/request/create_revision_request.dart';
import 'package:pkp_hub/data/models/revision.dart';

abstract class RevisionNetworkDataSource {
  Future<Result<Revision, Failure>> createRevision(
    String consultationId,
    CreateRevisionRequest request,
  );

  Future<Result<List<Revision>, Failure>> getRevisions(String consultationId);
}

class RevisionNetworkDataSourceImpl implements RevisionNetworkDataSource {
  final ApiClient _apiClient;
  final RevisionApiService _revisionApi;
  RevisionNetworkDataSourceImpl(this._apiClient, this._revisionApi);

  @override
  Future<Result<Revision, Failure>> createRevision(
    String consultationId,
    CreateRevisionRequest request,
  ) async {
    try {
      final response = await _revisionApi.createRevision(
        consultationId,
        request,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse create revision: $e'),
      );
    }
  }

  @override
  Future<Result<List<Revision>, Failure>> getRevisions(
    String consultationId,
  ) async {
    try {
      final response = await _revisionApi.getRevisions(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse revisions: $e'));
    }
  }
}
