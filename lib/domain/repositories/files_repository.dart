import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/files/files_network_data_source.dart';
import 'package:retrofit/dio.dart';

abstract class FilesRepository {
  Future<Result<HttpResponse<List<int>>, Failure>> downloadFile(String fileId);
}

class FilesRepositoryImpl implements FilesRepository {
  final FilesNetworkDataSource _networkDataSource;

  FilesRepositoryImpl(this._networkDataSource);

  @override
  Future<Result<HttpResponse<List<int>>, Failure>> downloadFile(
    String fileId,
  ) => _networkDataSource.downloadFile(fileId);
}
