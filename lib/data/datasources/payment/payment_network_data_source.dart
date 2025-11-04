import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/payment_api_service.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/request/create_payment_request.dart';

abstract class PaymentNetworkDataSource {
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  );

  Future<Result<List<Payment>, Failure>> getPayments(String consultationId);
  Future<Result<Payment, Failure>> approvePayment(String paymentId);
}

class PaymentNetworkDataSourceImpl implements PaymentNetworkDataSource {
  final ApiClient _apiClient;
  final PaymentApiService _paymentApi;
  PaymentNetworkDataSourceImpl(this._apiClient, this._paymentApi);

  @override
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  ) async {
    try {
      final response = await _paymentApi.createPayment(consultationId, request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse create payment: $e'),
      );
    }
  }

  @override
  Future<Result<List<Payment>, Failure>> getPayments(
    String consultationId,
  ) async {
    try {
      final response = await _paymentApi.getPayments(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse payments: $e'));
    }
  }

  @override
  Future<Result<Payment, Failure>> approvePayment(String paymentId) async {
    try {
      final response = await _paymentApi.approvePayment(paymentId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to approve payment: $e'));
    }
  }
}
