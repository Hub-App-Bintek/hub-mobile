class CreateSurveyScheduleRequest {
  final String scheduledDate; // e.g., 2024-01-18
  final String scheduledTime; // e.g., 14:00
  final String location;
  final int? surveyCost;
  final int? estimatedDurationHours;
  final String? surveyType;
  final String? notes;

  CreateSurveyScheduleRequest({
    required this.scheduledDate,
    required this.scheduledTime,
    required this.location,
    this.surveyCost,
    this.estimatedDurationHours,
    this.surveyType,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
    'scheduledDate': scheduledDate,
    'scheduledTime': scheduledTime,
    'location': location,
    if (surveyCost != null) 'surveyCost': surveyCost,
    if (estimatedDurationHours != null)
      'estimatedDurationHours': estimatedDurationHours,
    if (surveyType != null) 'surveyType': surveyType,
    if (notes != null) 'notes': notes,
  };
}
