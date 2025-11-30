/// Prototype design model for prototype catalog and details endpoints.
class PrototypeDesign {
  const PrototypeDesign({
    this.id,
    this.name,
    this.type,
    this.category,
    this.description,
    this.thumbnailUrls = const [],
    this.fileDedUrl,
    this.fileRabUrl,
    this.fileSpektekUrl,
    this.buildingArea,
    this.landArea,
    this.bedrooms,
    this.bathrooms,
    this.featuresJson,
    this.specificationsJson,
    this.imageUrl,
    this.folderPath,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? type;
  final String? category;
  final String? description;
  final List<String> thumbnailUrls;
  final String? fileDedUrl;
  final String? fileRabUrl;
  final String? fileSpektekUrl;
  final double? buildingArea;
  final double? landArea;
  final int? bedrooms;
  final int? bathrooms;
  final String? featuresJson;
  final String? specificationsJson;
  final String? imageUrl;
  final String? folderPath;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  factory PrototypeDesign.fromJson(Map<String, dynamic> json) {
    final thumbnails = <String>[
      ...?((json['thumbnailUrls'] as List?)?.map((e) => e.toString())),
    ];

    // Some payloads may expose only a single thumbnailUrl property.
    if (thumbnails.isEmpty && json['thumbnailUrl'] != null) {
      thumbnails.add(json['thumbnailUrl'].toString());
    }

    return PrototypeDesign(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      type: json['type']?.toString(),
      category: json['category']?.toString(),
      description: json['description']?.toString(),
      thumbnailUrls: thumbnails,
      fileDedUrl: json['fileDedUrl']?.toString(),
      fileRabUrl: json['fileRabUrl']?.toString(),
      fileSpektekUrl: json['fileSpektekUrl']?.toString(),
      buildingArea: (json['buildingArea'] as num?)?.toDouble(),
      landArea: (json['landArea'] as num?)?.toDouble(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      featuresJson: json['features']?.toString(),
      specificationsJson: json['specifications']?.toString(),
      imageUrl: json['imageUrl']?.toString(),
      folderPath: json['folderPath']?.toString(),
      status: json['status']?.toString(),
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'category': category,
    'description': description,
    'thumbnailUrls': thumbnailUrls,
    'fileDedUrl': fileDedUrl,
    'fileRabUrl': fileRabUrl,
    'fileSpektekUrl': fileSpektekUrl,
    'buildingArea': buildingArea,
    'landArea': landArea,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'features': featuresJson,
    'specifications': specificationsJson,
    'imageUrl': imageUrl,
    'folderPath': folderPath,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
