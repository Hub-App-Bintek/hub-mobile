class ApproveContractRequest {
  ApproveContractRequest({
    required this.approvedDocumentVersionId,
    this.revisionNotes,
  });

  final String approvedDocumentVersionId;
  final String? revisionNotes;

  Map<String, dynamic> toJson() => {
    'approvedDocumentVersionId': approvedDocumentVersionId,
    if (revisionNotes != null) 'revisionNotes': revisionNotes,
  };
}
