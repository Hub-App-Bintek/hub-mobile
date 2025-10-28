import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/request/create_payment_request.dart';

abstract class PaymentNetworkDataSource {
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  );

  Future<Result<List<Payment>, Failure>> getPayments(String consultationId);
}

class PaymentNetworkDataSourceImpl implements PaymentNetworkDataSource {
  final ApiClient _apiClient;
  PaymentNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<Payment, Failure>> createPayment(
    String consultationId,
    CreatePaymentRequest request,
  ) async {
    try {
      final res = await _apiClient.dio.post(
        '${ApiEndpoints.payments}?consultationId=$consultationId',
        data: request.toJson(),
      );
      return Success(Payment.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.get(
        '${ApiEndpoints.payments}?consultationId=$consultationId',
      );
      final data = res.data as List<dynamic>;
      return Success(
        data.map((e) => Payment.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse payments: $e'));
    }
  }
}
