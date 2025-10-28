// Prototype design model for catalog (non-consultation)
class PrototypeDesign {
  final String? id;
  final String? name;
  final String? type;
  final String? category;
  final String? description;
  final String? thumbnailUrl;
  final String? fileDedUrl;
  final String? fileRabUrl;
  final String? fileSpektekUrl;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  PrototypeDesign({
    this.id,
    this.name,
    this.type,
    this.category,
    this.description,
    this.thumbnailUrl,
    this.fileDedUrl,
    this.fileRabUrl,
    this.fileSpektekUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory PrototypeDesign.fromJson(Map<String, dynamic> json) =>
      PrototypeDesign(
        id: json['id']?.toString(),
        name: json['name']?.toString(),
        type: json['type']?.toString(),
        category: json['category']?.toString(),
        description: json['description']?.toString(),
        thumbnailUrl: json['thumbnailUrl']?.toString(),
        fileDedUrl: json['fileDedUrl']?.toString(),
        fileRabUrl: json['fileRabUrl']?.toString(),
        fileSpektekUrl: json['fileSpektekUrl']?.toString(),
        status: json['status']?.toString(),
        createdAt: json['createdAt']?.toString(),
        updatedAt: json['updatedAt']?.toString(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'category': category,
    'description': description,
    'thumbnailUrl': thumbnailUrl,
    'fileDedUrl': fileDedUrl,
    'fileRabUrl': fileRabUrl,
    'fileSpektekUrl': fileSpektekUrl,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
