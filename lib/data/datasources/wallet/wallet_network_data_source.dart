import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';
import 'package:pkp_hub/core/network/services/wallet_api_service.dart';

abstract class WalletNetworkDataSource {
  Future<Result<WalletResponse, Failure>> getBalance();
}

class WalletNetworkDataSourceImpl implements WalletNetworkDataSource {
  final ApiClient _apiClient;
  final WalletApiService _walletApi;

  WalletNetworkDataSourceImpl(this._apiClient, this._walletApi);

  @override
  Future<Result<WalletResponse, Failure>> getBalance() async {
    try {
      final response = await _walletApi.getWalletBalance();
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse wallet response: $e'),
      );
    }
  }
}
