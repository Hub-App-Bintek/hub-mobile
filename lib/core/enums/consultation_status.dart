// Consultation status enum and helpers for string mapping.

enum ConsultationStatus {
  waitingForConfirmation,
  waitingForSurveySchedule,
  waitingForScheduleApproval,
  surveyScheduled,
  doneSurvey,
  needRevision,
  finalStatus,
  doneConsultation,
  unknown,
}

const Map<ConsultationStatus, String> _statusToString = {
  ConsultationStatus.waitingForConfirmation: 'MENUNGGU_KONFIRMASI_KONSULTAN',
  ConsultationStatus.waitingForSurveySchedule: 'MENUNGGU_JADWAL_SURVEY',
  ConsultationStatus.waitingForScheduleApproval: 'MENUNGGU_APPROVAL_JADWAL',
  ConsultationStatus.surveyScheduled: 'SURVEY_DIJADWALKAN',
  ConsultationStatus.doneSurvey: 'SURVEY_SELESAI',
  ConsultationStatus.needRevision: 'REVISI',
  ConsultationStatus.finalStatus: 'FINAL',
  ConsultationStatus.doneConsultation: 'SELESAI',
  ConsultationStatus.unknown: 'UNKNOWN',
};

final Map<String, ConsultationStatus> _stringToStatus = {
  for (final entry in _statusToString.entries) entry.value: entry.key,
};

String consultationStatusToString(ConsultationStatus status) =>
    _statusToString[status] ?? 'UNKNOWN';

ConsultationStatus consultationStatusFromString(String? value) {
  if (value == null) return ConsultationStatus.unknown;
  return _stringToStatus[value.toUpperCase()] ?? ConsultationStatus.unknown;
}
