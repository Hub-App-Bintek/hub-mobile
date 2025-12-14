import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    String? title,
    required String url,
    String? description, // Making description optional as it might be null
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}