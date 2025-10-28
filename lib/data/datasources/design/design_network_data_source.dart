import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';

abstract class DesignNetworkDataSource {
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns();
}

class DesignNetworkDataSourceImpl implements DesignNetworkDataSource {
  final ApiClient _apiClient;
  DesignNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns() async {
    try {
      final res = await _apiClient.dio.get(ApiEndpoints.prototypeDesigns);
      final data = res.data as List<dynamic>;
      return Success(
        data
            .map((e) => PrototypeDesign.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse prototype designs: $e'),
      );
    }
  }
}
