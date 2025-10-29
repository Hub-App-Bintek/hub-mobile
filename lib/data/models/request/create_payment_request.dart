import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payment_request.freezed.dart';
part 'create_payment_request.g.dart';

@freezed
class CreatePaymentRequest with _$CreatePaymentRequest {
  const factory CreatePaymentRequest({
    required num amount,
    required String description,
    required String paymentMethod, // BANK_TRANSFER, etc
  }) = _CreatePaymentRequest;

  factory CreatePaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentRequestFromJson(json);
}
