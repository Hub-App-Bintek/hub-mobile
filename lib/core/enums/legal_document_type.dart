class LegalDocumentType {
  const LegalDocumentType({required this.id, required this.title});

  final String id;
  final String title;
}

const legalDocumentTerms = LegalDocumentType(
  id: 'syarat_dan_ketentuan',
  title: 'Syarat dan Ketentuan',
);

const legalDocumentPrivacy = LegalDocumentType(
  id: 'kebijakan_privasi',
  title: 'Kebijakan Privasi',
);

const legalDocumentTypes = [legalDocumentTerms, legalDocumentPrivacy];
