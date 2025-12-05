class ConsultationType {
  final String name;

  const ConsultationType({required this.name});
}

const consultationPaid = ConsultationType(name: 'BERBAYAR');
const consultationFree = ConsultationType(name: 'GRATIS');

const consultationTypeList = [consultationPaid, consultationFree];
