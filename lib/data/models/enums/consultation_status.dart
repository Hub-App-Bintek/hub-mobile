// Enum of consultation statuses based on backend documentation
// Keeping string values equal to API to make (de)serialization predictable if needed later.

enum ConsultationStatus {
  menungguKonfirmasiKonsultan,
  menyiapkanKontrak,
  menungguApprovalKontrak,
  kontrakDisetujui,
  menungguJadwalSurvey,
  menungguApprovalJadwal,
  surveyDijadwalkan,
  surveySelesai,
  aktif,
  revisi,
  finalStatus,
  selesai,
  unknown,
}

class ConsultationStatusX {
  const ConsultationStatusX._();

  static ConsultationStatus fromString(String? raw) {
    switch ((raw ?? '').toUpperCase()) {
      case 'MENUNGGU_KONFIRMASI_KONSULTAN':
        return ConsultationStatus.menungguKonfirmasiKonsultan;
      case 'MENYIAPKAN_KONTRAK':
        return ConsultationStatus.menyiapkanKontrak;
      case 'MENUNGGU_APPROVAL_KONTRAK':
        return ConsultationStatus.menungguApprovalKontrak;
      case 'KONTRAK_DISETUJUI':
        return ConsultationStatus.kontrakDisetujui;
      case 'MENUNGGU_JADWAL_SURVEY':
        return ConsultationStatus.menungguJadwalSurvey;
      case 'MENUNGGU_APPROVAL_JADWAL':
        return ConsultationStatus.menungguApprovalJadwal;
      case 'SURVEY_DIJADWALKAN':
        return ConsultationStatus.surveyDijadwalkan;
      case 'SURVEY_SELESAI':
        return ConsultationStatus.surveySelesai;
      case 'AKTIF':
        return ConsultationStatus.aktif;
      case 'REVISI':
        return ConsultationStatus.revisi;
      case 'FINAL':
        return ConsultationStatus.finalStatus;
      case 'SELESAI':
        return ConsultationStatus.selesai;
      default:
        return ConsultationStatus.unknown;
    }
  }

  static String toApiString(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.menungguKonfirmasiKonsultan:
        return 'MENUNGGU_KONFIRMASI_KONSULTAN';
      case ConsultationStatus.menyiapkanKontrak:
        return 'MENYIAPKAN_KONTRAK';
      case ConsultationStatus.menungguApprovalKontrak:
        return 'MENUNGGU_APPROVAL_KONTRAK';
      case ConsultationStatus.kontrakDisetujui:
        return 'KONTRAK_DISETUJUI';
      case ConsultationStatus.menungguJadwalSurvey:
        return 'MENUNGGU_JADWAL_SURVEY';
      case ConsultationStatus.menungguApprovalJadwal:
        return 'MENUNGGU_APPROVAL_JADWAL';
      case ConsultationStatus.surveyDijadwalkan:
        return 'SURVEY_DIJADWALKAN';
      case ConsultationStatus.surveySelesai:
        return 'SURVEY_SELESAI';
      case ConsultationStatus.aktif:
        return 'AKTIF';
      case ConsultationStatus.revisi:
        return 'REVISI';
      case ConsultationStatus.finalStatus:
        return 'FINAL';
      case ConsultationStatus.selesai:
        return 'SELESAI';
      case ConsultationStatus.unknown:
        return 'UNKNOWN';
    }
  }
}
