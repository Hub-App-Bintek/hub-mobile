import 'package:flutter/foundation.dart';

// This file defines a SHARED Data Transfer Object (DTO) or model.
// Models in the data layer represent the structure of data from external sources (API, local DB)
// and should include mechanisms for serialization/deserialization (fromJson, toJson).
// They should be immutable as a best practice.

@immutable
class SharedExampleModel {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;

  const SharedExampleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  // Factory constructor for creating a new SharedExampleModel instance from a map (e.g., JSON from API).
  // This handles potential type mismatches and missing fields gracefully.
  factory SharedExampleModel.fromJson(Map<String, dynamic> json) {
    return SharedExampleModel(
      id: json['id'] as String? ?? '', // Provide default or handle error if id is critical
      name: json['name'] as String? ?? 'Default Name',
      description: json['description'] as String? ?? 'No description',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now()
          : DateTime.now(),
    );
  }

  // Method for converting a SharedExampleModel instance to a map (e.g., for sending to API or local storage).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Optional: Implement copyWith for easier modification of immutable objects
  SharedExampleModel copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
  }) {
    return SharedExampleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Optional: Override == and hashCode for value equality if objects are stored in sets or used as map keys.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SharedExampleModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ createdAt.hashCode;
}

// Add other shared models as needed by your application.
// These models are typically used by the shared repositories and data sources.
