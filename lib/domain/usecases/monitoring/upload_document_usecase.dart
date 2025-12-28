import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';

import '../../repositories/monitoring_repository.dart';

class UploadDocumentUseCase {
  final MonitoringRepository _repository;

  UploadDocumentUseCase(this._repository);

  Future<Result<MonitoringDocumentModel, Failure>> call({
    required int monitoringId,
    required File file,
    required String title,
    String? description,
  }) {
    return _repository.uploadConstructionDocument(
      monitoringId: monitoringId,
      file: file,
      title: title,
      description: description,
    );
  }
}