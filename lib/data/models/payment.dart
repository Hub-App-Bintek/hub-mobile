class Payment {
  final String? id;
  final String? consultationId;
  final String? type;
  final int? termin;
  final double? amount;
  final String? method;
  final String? description;
  final String? status;
  final String? paymentGatewayRef;
  final String? dueDate;
  final String? referenceId;
  final String? createdAt;
  final String? updatedAt;

  Payment({
    this.id,
    this.consultationId,
    this.type,
    this.termin,
    this.amount,
    this.method,
    this.description,
    this.status,
    this.paymentGatewayRef,
    this.dueDate,
    this.referenceId,
    this.createdAt,
    this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    type: json['type']?.toString(),
    termin: json['termin'] is int
        ? json['termin'] as int
        : int.tryParse(json['termin']?.toString() ?? ''),
    amount: json['amount'] is num
        ? (json['amount'] as num).toDouble()
        : double.tryParse(json['amount']?.toString() ?? ''),
    method: json['method']?.toString(),
    description: json['description']?.toString(),
    status: json['status']?.toString(),
    paymentGatewayRef: json['paymentGatewayRef']?.toString(),
    dueDate: json['dueDate']?.toString(),
    referenceId: json['referenceId']?.toString(),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'type': type,
    'termin': termin,
    'amount': amount,
    'method': method,
    'description': description,
    'status': status,
    'paymentGatewayRef': paymentGatewayRef,
    'dueDate': dueDate,
    'referenceId': referenceId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
