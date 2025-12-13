import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/download_helper.dart';
import 'package:pkp_hub/core/network/result.dart';

abstract class FilesNetworkDataSource {
  Future<Result<DownloadedFile, Failure>> downloadFile(String fileId);
}

class FilesNetworkDataSourceImpl implements FilesNetworkDataSource {
  final ApiClient _apiClient;

  FilesNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<DownloadedFile, Failure>> downloadFile(String fileId) async {
    final url = ApiEndpoints.filesDownload.replaceFirst(
      '{fileId}',
      fileId.trim(),
    );

    return downloadToTempFile(
      apiClient: _apiClient,
      url: url,
      prefix: 'file-$fileId',
      fallbackFileName: 'file-$fileId.bin',
      options: Options(responseType: ResponseType.stream),
    );
  }
}
