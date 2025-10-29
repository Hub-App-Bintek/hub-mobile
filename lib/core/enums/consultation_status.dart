// Consultation status enum and helpers for string mapping.

enum ConsultationStatus {
  waitingForConfirmation, // MENUNGGU_KONFIRMASI_KONSULTAN
  preparingContract, // MENYIAPKAN_KONTRAK
  waitingForContractApproval, // MENUNGGU_APPROVAL_KONTRAK
  contractApproved, // KONTRAK_DISETUJUI
  waitingForSurveySchedule, // MENUNGGU_JADWAL_SURVEY
  waitingForScheduleApproval, // MENUNGGU_APPROVAL_JADWAL
  surveyScheduled, // SURVEY_DIJADWALKAN
  doneSurvey, // SURVEY_SELESAI
  active, // AKTIF
  needRevision, // REVISI
  finalStatus, // FINAL
  doneConsultation, // SELESAI
  unknown,
}

const Map<ConsultationStatus, String> _statusToString = {
  ConsultationStatus.waitingForConfirmation: 'MENUNGGU_KONFIRMASI_KONSULTAN',
  ConsultationStatus.preparingContract: 'MENYIAPKAN_KONTRAK',
  ConsultationStatus.waitingForContractApproval: 'MENUNGGU_APPROVAL_KONTRAK',
  ConsultationStatus.contractApproved: 'KONTRAK_DISETUJUI',
  ConsultationStatus.waitingForSurveySchedule: 'MENUNGGU_JADWAL_SURVEY',
  ConsultationStatus.waitingForScheduleApproval: 'MENUNGGU_APPROVAL_JADWAL',
  ConsultationStatus.surveyScheduled: 'SURVEY_DIJADWALKAN',
  ConsultationStatus.doneSurvey: 'SURVEY_SELESAI',
  ConsultationStatus.active: 'AKTIF',
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
