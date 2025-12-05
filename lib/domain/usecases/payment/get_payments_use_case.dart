import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/domain/repositories/payment_repository.dart';

class GetPaymentsUseCase extends UseCase<List<Payment>, String> {
  final PaymentRepository _repository;
  GetPaymentsUseCase(this._repository);

  @override
  Future<Result<List<Payment>, Failure>> call(String consultationId) {
    return _repository.getPayments(consultationId);
  }
}
