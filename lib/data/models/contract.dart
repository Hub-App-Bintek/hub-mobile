class Contract {
  final String? id;
  final String? consultationId;
  final String? pdfUrl;
  final bool? digitalSignature;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Contract({
    this.id,
    this.consultationId,
    this.pdfUrl,
    this.digitalSignature,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    pdfUrl: json['pdfUrl']?.toString(),
    digitalSignature: json['digitalSignature'] is bool
        ? json['digitalSignature'] as bool
        : json['digitalSignature'] == null
        ? null
        : json['digitalSignature'].toString().toLowerCase() == 'true',
    status: json['status']?.toString(),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'pdfUrl': pdfUrl,
    'digitalSignature': digitalSignature,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
