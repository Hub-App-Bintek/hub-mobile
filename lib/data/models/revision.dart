class Revision {
  final String? id;
  final String? consultationId;
  final String? version;
  final String? notes;
  final String? fileUrl;
  final String? status;
  final int? revisionCount;
  final String? createdAt;
  final String? updatedAt;

  Revision({
    this.id,
    this.consultationId,
    this.version,
    this.notes,
    this.fileUrl,
    this.status,
    this.revisionCount,
    this.createdAt,
    this.updatedAt,
  });

  factory Revision.fromJson(Map<String, dynamic> json) => Revision(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    version: json['version']?.toString(),
    notes: json['notes']?.toString(),
    fileUrl: json['fileUrl']?.toString(),
    status: json['status']?.toString(),
    revisionCount: json['revisionCount'] is int
        ? json['revisionCount'] as int
        : int.tryParse(json['revisionCount']?.toString() ?? ''),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'version': version,
    'notes': notes,
    'fileUrl': fileUrl,
    'status': status,
    'revisionCount': revisionCount,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
