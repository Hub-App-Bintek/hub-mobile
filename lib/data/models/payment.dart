class Payment {
  final String? id;
  final String? consultationId;
  final int? termin;
  final num? amount;
  final String? method;
  final String? status;
  final String? paymentGatewayRef;
  final String? createdAt;
  final String? updatedAt;

  Payment({
    this.id,
    this.consultationId,
    this.termin,
    this.amount,
    this.method,
    this.status,
    this.paymentGatewayRef,
    this.createdAt,
    this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    termin: json['termin'] is int
        ? json['termin'] as int
        : int.tryParse(json['termin']?.toString() ?? ''),
    amount: json['amount'] is num
        ? json['amount'] as num
        : num.tryParse(json['amount']?.toString() ?? ''),
    method: json['method']?.toString(),
    status: json['status']?.toString(),
    paymentGatewayRef: json['paymentGatewayRef']?.toString(),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'termin': termin,
    'amount': amount,
    'method': method,
    'status': status,
    'paymentGatewayRef': paymentGatewayRef,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
