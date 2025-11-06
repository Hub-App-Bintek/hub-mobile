// Design document model matching API doc
class DesignDocument {
  final String? id;
  final String? consultationId;
  final String? fileDedUrl;
  final String? fileRabUrl;
  final String? fileSpektekUrl;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  DesignDocument({
    this.id,
    this.consultationId,
    this.fileDedUrl,
    this.fileRabUrl,
    this.fileSpektekUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DesignDocument.fromJson(Map<String, dynamic> json) => DesignDocument(
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
