import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';

abstract class WalletLocalDataSource {
  Future<void> saveBalance(WalletResponse response);

  Future<double> getBalance();
}

class WalletLocalDataSourceImpl extends WalletLocalDataSource {
  final UserStorage _userStorage;

  WalletLocalDataSourceImpl(this._userStorage);

  @override
  Future<double> getBalance() async {
    return await _userStorage.getBalance() ?? 0.0;
  }

  @override
  Future<void> saveBalance(WalletResponse response) async {
    await _userStorage.saveBalance(response.balance ?? 0.0);
  }
}
