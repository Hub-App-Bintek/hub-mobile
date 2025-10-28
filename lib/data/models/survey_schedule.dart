// Basic model for survey schedule matching API doc.
class SurveySchedule {
  final String? id;
  final String? consultationId;
  final String? proposedDateTime;
  final String? notes;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  SurveySchedule({
    this.id,
    this.consultationId,
    this.proposedDateTime,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SurveySchedule.fromJson(Map<String, dynamic> json) => SurveySchedule(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    proposedDateTime: json['proposedDateTime']?.toString(),
    notes: json['notes']?.toString(),
    status: json['status']?.toString(),
    createdAt: json['createdAt']?.toString(),
    updatedAt: json['updatedAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'proposedDateTime': proposedDateTime,
    'notes': notes,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
