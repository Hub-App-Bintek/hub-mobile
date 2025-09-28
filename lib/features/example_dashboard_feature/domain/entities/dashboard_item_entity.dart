// This file defines a feature-specific domain entity for a dashboard item.
// Domain entities are core business objects for this feature, independent of data sources or UI.
// They should be plain Dart objects and immutable as a best practice.

import 'package:flutter/foundation.dart';

@immutable
class DashboardItemEntity {
  final String id;
  final String title;
  final String imageUrl; // Represents business-relevant image information
  final String? callToActionUrl; // Optional: A URL for navigation or action

  const DashboardItemEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.callToActionUrl,
  });

  // Entities typically do not have fromJson/toJson methods as that is a data layer concern.
  // Mapping from data models (DTOs) to domain entities occurs in the repository implementation.

  DashboardItemEntity copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? callToActionUrl,
  }) {
    return DashboardItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      callToActionUrl: callToActionUrl ?? this.callToActionUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardItemEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          callToActionUrl == other.callToActionUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      callToActionUrl.hashCode;
}

// Add other entities specific to the dashboard feature as needed.
