// This file defines a feature-specific Data Transfer Object (DTO) or model for a dashboard item.
// Models in the data layer represent the structure of data from external sources (API, local DB)
// and include mechanisms for serialization/deserialization (fromJson, toJson).
// They should be immutable as a best practice.

import 'package:flutter/foundation.dart';

@immutable
class DashboardItemModel {
  final String itemId;
  final String title;
  final String imageUrl; // Optional: if dashboard items have images
  final String? subtitle; // Optional additional information
  final DateTime lastUpdated;

  const DashboardItemModel({
    required this.itemId,
    required this.title,
    required this.imageUrl,
    this.subtitle,
    required this.lastUpdated,
  });

  factory DashboardItemModel.fromJson(Map<String, dynamic> json) {
    return DashboardItemModel(
      itemId: json['itemId'] as String? ?? '',
      title: json['title'] as String? ?? 'Untitled Item',
      imageUrl: json['imageUrl'] as String? ?? '', // Handle missing image URL appropriately
      subtitle: json['subtitle'] as String?,
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.tryParse(json['lastUpdated'] as String? ?? '') ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'title': title,
      'imageUrl': imageUrl,
      if (subtitle != null) 'subtitle': subtitle,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  DashboardItemModel copyWith({
    String? itemId,
    String? title,
    String? imageUrl,
    String? subtitle,
    DateTime? lastUpdated,
  }) {
    return DashboardItemModel(
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      subtitle: subtitle ?? this.subtitle,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardItemModel &&
          runtimeType == other.runtimeType &&
          itemId == other.itemId &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          subtitle == other.subtitle &&
          lastUpdated == other.lastUpdated;

  @override
  int get hashCode =>
      itemId.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      subtitle.hashCode ^
      lastUpdated.hashCode;
}

// Add other models specific to the dashboard feature as needed,
// e.g., DashboardSummaryModel, DashboardChartDataModel, etc.
