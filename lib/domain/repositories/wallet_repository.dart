import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/wallet/wallet_local_repository.dart';
import 'package:pkp_hub/data/datasources/wallet/wallet_network_data_source.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';

abstract class WalletRepository {
  Future<Result<WalletResponse, Failure>> getBalance();
}

class WalletRepositoryImpl implements WalletRepository {
  final WalletNetworkDataSource _networkDataSource;
  final WalletLocalDataSource _localDataSource;

  WalletRepositoryImpl(this._networkDataSource, this._localDataSource);

  @override
  Future<Result<WalletResponse, Failure>> getBalance() async {
    final result = await _networkDataSource.getBalance();
    if (result is Success<WalletResponse, Failure>) {
      await _localDataSource.saveBalance(result.value);
    }

    return result;
  }
}
