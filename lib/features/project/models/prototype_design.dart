import 'package:equatable/equatable.dart';

class PrototypeDesign extends Equatable {
  const PrototypeDesign({
    required this.title,
    required this.landArea,
    required this.buildingArea,
    required this.subtitle,
  });

  final String title;
  final String landArea;
  final String buildingArea;
  final String subtitle;

  @override
  List<Object?> get props => [title, landArea, buildingArea, subtitle];
}
