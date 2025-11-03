import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/files_api_service.dart';

abstract class FilesNetworkDataSource {
  Future<Result<HttpResponse<List<int>>, Failure>> downloadFile(String fileId);
}

class FilesNetworkDataSourceImpl implements FilesNetworkDataSource {
  final ApiClient _apiClient;
  final FilesApiService _filesApi;

  FilesNetworkDataSourceImpl(this._apiClient, this._filesApi);

  @override
  Future<Result<HttpResponse<List<int>>, Failure>> downloadFile(
    String fileId,
  ) async {
    try {
      final res = await _filesApi.downloadFile(fileId);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to download file: $e'));
    }
  }
}
