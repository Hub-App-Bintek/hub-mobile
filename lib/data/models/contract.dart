class Contract {
  final String? id;
  final String? consultationId;
  final String? pdfUrl; // backward-compat
  final String? fileUrl; // new API field
  final bool? digitalSignature;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Contract({
    this.id,
    this.consultationId,
    this.pdfUrl,
    this.fileUrl,
    this.digitalSignature,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    pdfUrl: json['pdfUrl']?.toString(),
    fileUrl: json['fileUrl']?.toString() ?? json['pdfUrl']?.toString(),
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
    'fileUrl': fileUrl,
    'digitalSignature': digitalSignature,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
