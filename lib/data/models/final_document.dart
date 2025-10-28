// Final document model matching API doc
class FinalDocument {
  final String? id;
  final String? consultationId;
  final String? fileDedUrl;
  final String? fileRabUrl;
  final String? fileSpektekUrl;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  FinalDocument({
    this.id,
    this.consultationId,
    this.fileDedUrl,
    this.fileRabUrl,
    this.fileSpektekUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory FinalDocument.fromJson(Map<String, dynamic> json) => FinalDocument(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    fileDedUrl: json['fileDedUrl']?.toString(),
    fileRabUrl: json['fileRabUrl']?.toString(),
    fileSpektekUrl: json['fileSpektekUrl']?.toString(),
    status: json['status']?.toString(),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'fileDedUrl': fileDedUrl,
    'fileRabUrl': fileRabUrl,
    'fileSpektekUrl': fileSpektekUrl,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
