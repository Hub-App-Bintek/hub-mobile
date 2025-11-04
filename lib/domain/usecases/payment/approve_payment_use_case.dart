import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/domain/repositories/payment_repository.dart';

class ApprovePaymentUseCase extends UseCase<Payment, String> {
  final PaymentRepository _repository;
  ApprovePaymentUseCase(this._repository);

  @override
  Future<Result<Payment, Failure>> call(String paymentId) {
    return _repository.approvePayment(paymentId);
  }
}
