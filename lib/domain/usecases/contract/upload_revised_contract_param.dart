import 'dart:io';

import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';

class UploadRevisedContractParam {
  UploadRevisedContractParam({
    required this.consultationId,
    required this.request,
    required this.file,
  });

  final String consultationId;
  final UploadContractRequest request;
  final File file;
}
