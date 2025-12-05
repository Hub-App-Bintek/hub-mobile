import 'dart:io';

import 'package:pkp_hub/data/models/request/upload_revised_contract_request.dart';

class UploadRevisedContractParam {
  UploadRevisedContractParam({required this.request, required this.file});

  final UploadRevisedContractRequest request;
  final File file;
}
