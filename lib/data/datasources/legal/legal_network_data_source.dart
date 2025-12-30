import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';

abstract class LegalNetworkDataSource {
  Future<Result<String, Failure>> getDocument(String type);
}

class LegalNetworkDataSourceImpl implements LegalNetworkDataSource {
  LegalNetworkDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Result<String, Failure>> getDocument(String type) async {
    final endpoint = ApiEndpoints.terms.replaceFirst('{type}', type);
    try {
      final response = await _apiClient.dio.get<String>(
        endpoint,
        options: Options(
          responseType: ResponseType.plain,
          headers: {'Accept': 'text/html'},
        ),
      );
      final body = response.data ?? '';
      if (body.isEmpty) {
        return const Error(
          ServerFailure(message: 'Empty response from legal document API'),
        );
      }
      return Success(body);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }
}
