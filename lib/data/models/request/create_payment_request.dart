class CreatePaymentRequest {
  final num amount;
  final String description;
  final String paymentMethod; // BANK_TRANSFER, etc

  CreatePaymentRequest({
    required this.amount,
    required this.description,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'description': description,
    'paymentMethod': paymentMethod,
  };
}
