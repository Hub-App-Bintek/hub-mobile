// This file defines a SHARED domain entity.
// Domain entities are core business objects, independent of data sources or UI.
// They should be plain Dart objects and immutable as a best practice.

import 'package:flutter/foundation.dart';

@immutable
class SharedExampleEntity {
  final String id;
  final String name;
  final String details; // Represents some business-relevant detail

  const SharedExampleEntity({
    required this.id,
    required this.name,
    required this.details,
  });

  // Entities typically do not have fromJson/toJson methods, as that's a data layer concern.
  // If mapping is needed, it happens in the repository implementation or a dedicated mapper class.

  // Optional: Implement copyWith for easier modification of immutable objects
  SharedExampleEntity copyWith({
    String? id,
    String? name,
    String? details,
  }) {
    return SharedExampleEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
    );
  }

  // Optional: Override == and hashCode for value equality, especially if used in state management or collections.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SharedExampleEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          details == other.details;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ details.hashCode;
}

// Add other shared domain entities as needed.
