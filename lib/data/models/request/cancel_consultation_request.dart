class CancelConsultationRequest {
  const CancelConsultationRequest({required this.reason});

  final String reason;

  Map<String, dynamic> toJson() => {'reason': reason};
}
