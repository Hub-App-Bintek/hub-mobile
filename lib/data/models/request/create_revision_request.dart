class CreateRevisionRequest {
  final String title;
  final String description;
  final String priority; // HIGH, MEDIUM, LOW

  CreateRevisionRequest({
    required this.title,
    required this.description,
    required this.priority,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'priority': priority,
  };
}
