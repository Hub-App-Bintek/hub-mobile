import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/payment/payment_network_data_source.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/request/create_payment_request.dart';

abstract class PaymentRepository {
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  );
  Future<Result<List<Payment>, Failure>> getPayments(String consultationId);
}

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentNetworkDataSource _ds;
  PaymentRepositoryImpl(this._ds);

  @override
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  ) => _ds.createPayment(consultationId, request);

  @override
  Future<Result<List<Payment>, Failure>> getPayments(String consultationId) =>
      _ds.getPayments(consultationId);
}
