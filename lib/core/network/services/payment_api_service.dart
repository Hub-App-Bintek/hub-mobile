import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/request/create_payment_request.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_api_service.g.dart';

@RestApi()
abstract class PaymentApiService {
  factory PaymentApiService(Dio dio, {String? baseUrl}) = _PaymentApiService;

  @POST(ApiEndpoints.payments)
  Future<Payment> createPayment(
    @Query('consultationId') String consultationId,
    @Body() CreatePaymentRequest body,
  );

  @GET(ApiEndpoints.payments)
  Future<List<Payment>> getPayments(
    @Query('consultationId') String consultationId,
  );
}
