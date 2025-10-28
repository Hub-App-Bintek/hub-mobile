// Revision network data source for creating and fetching revisions
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
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
  RevisionNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<Revision, Failure>> createRevision(
    String consultationId,
    CreateRevisionRequest request,
  ) async {
    try {
      final res = await _apiClient.dio.post(
        '${ApiEndpoints.revisions}?consultationId=$consultationId',
        data: request.toJson(),
      );
      return Success(Revision.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.get(
        '${ApiEndpoints.revisions}?consultationId=$consultationId',
      );
      final data = res.data as List<dynamic>;
      return Success(
        data.map((e) => Revision.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse revisions: $e'));
    }
  }
}
