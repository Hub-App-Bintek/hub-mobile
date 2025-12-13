// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/contract/upload_contract_param.dart
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';

class UploadContractParam extends Equatable {
  final String consultationId;
  final File file;
  final UploadContractRequest request;

  const UploadContractParam({
    required this.consultationId,
    required this.file,
    required this.request,
  });

  @override
  List<Object?> get props => [consultationId, file.path, request];
}
