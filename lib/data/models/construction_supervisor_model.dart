import 'package:freezed_annotation/freezed_annotation.dart';

part 'construction_supervisor_model.freezed.dart';

part 'construction_supervisor_model.g.dart';

class ConstructionSupervisor {
  ConstructionSupervisor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.price,
    required this.distance,
  });

  final int id;
  final String name;
  final String specialization;
  final double price;
  final double distance;

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';

  String get priceLabel {
    final hasDecimal = price % 1 != 0;
    final value = hasDecimal
        ? price.toStringAsFixed(1)
        : price.toStringAsFixed(0);
    return 'IDR $value ';
  }

  String get distanceLabel {
    if (distance < 2) return '< 2 Km';
    if (distance < 5) return '2 - 5 Km';
    return '5 - 10 Km';
  }
}

@freezed
class ConstructionSupervisorModel with _$ConstructionSupervisorModel {
  const factory ConstructionSupervisorModel({
    required int id,
    required String name,
    required String type,
    required String specialization,
    required double rate,
    required String availabilityStatus,
    required String location,
  }) = _ConstructionSupervisorModel;

  factory ConstructionSupervisorModel.fromJson(Map<String, dynamic> json) =>
      _$ConstructionSupervisorModelFromJson(json);
}

// Mapper to convert the Data Model to a Domain Entity
extension ConstructionSupervisorModelX on ConstructionSupervisorModel {
  ConstructionSupervisor toEntity() {
    return ConstructionSupervisor(
      id: id,
      name: name,
      specialization: specialization,
      price: rate,
      // Prefer packageCost if available
      distance: 0, // Placeholder, will be calculated later
    );
  }
}
