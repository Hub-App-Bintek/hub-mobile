class ConsultationFilterStatus {
  final String id;
  final String name;

  const ConsultationFilterStatus({required this.id, required this.name});
}

const consultationFilterInProgress = ConsultationFilterStatus(
  id: 'SEDANG_BERJALAN',
  name: 'Sedang Berjalan',
);
const consultationFilterWaitingConfirmation = ConsultationFilterStatus(
  id: 'MENUNGGU_KONFIRMASI',
  name: 'Menunggu Konfirmasi',
);
const consultationFilterDone = ConsultationFilterStatus(
  id: 'SELESAI',
  name: 'Selesai',
);

const consultationFilterStatusList = [
  consultationFilterInProgress,
  consultationFilterWaitingConfirmation,
  consultationFilterDone,
];
