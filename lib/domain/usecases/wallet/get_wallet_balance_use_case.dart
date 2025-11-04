import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/wallet_repository.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';

class GetWalletBalanceUseCase extends UseCaseNoParams<WalletResponse> {
  final WalletRepository _repository;

  GetWalletBalanceUseCase(this._repository);

  @override
  Future<Result<WalletResponse, Failure>> call() {
    return _repository.getBalance();
  }
}
