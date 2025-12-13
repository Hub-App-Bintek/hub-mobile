import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/design_document/design_document_network_data_source.dart';
import 'package:pkp_hub/data/models/response/design_document_approval_response.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/data/models/response/design_document_revision_response.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';

abstract class DesignDocumentRepository {
  Future<Result<UploadDesignDocumentResponse, Failure>> uploadDesignDocuments({
    required String consultationId,
    File? fileDed,
    File? fileRab,
    File? fileBoq,
  });

  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  );

  Future<Result<DesignDocumentApprovalResponse, Failure>>
  approveDesignDocuments(
    String designDocumentId, {
    String? approvedVersion,
    String? revisionNotes,
  });

  Future<Result<DesignDocumentRevisionResponse, Failure>> askDesignRevision({
    required String consultationId,
    required String designDocumentId,
    required String notes,
  });

  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  });

  Future<Result<DownloadedFile, Failure>> downloadDesignVersionZip(
    String version,
    String consultationId,
  );
}

class DesignDocumentRepositoryImpl implements DesignDocumentRepository {
  final DesignDocumentNetworkDataSource _ds;

  DesignDocumentRepositoryImpl(this._ds);

  @override
  Future<Result<UploadDesignDocumentResponse, Failure>> uploadDesignDocuments({
    required String consultationId,
    File? fileDed,
    File? fileRab,
    File? fileBoq,
  }) => _ds.uploadDesignDocuments(
    consultationId: consultationId,
    fileDed: fileDed,
    fileRab: fileRab,
    fileBoq: fileBoq,
  );

  @override
  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  ) => _ds.downloadDesignDocument(documentId);

  @override
  Future<Result<DesignDocumentApprovalResponse, Failure>>
  approveDesignDocuments(
    String designDocumentId, {
    String? approvedVersion,
    String? revisionNotes,
  }) => _ds.approveDesignDocuments(
    designDocumentId,
    approvedVersion: approvedVersion,
    revisionNotes: revisionNotes,
  );

  @override
  Future<Result<DesignDocumentRevisionResponse, Failure>> askDesignRevision({
    required String consultationId,
    required String designDocumentId,
    required String notes,
  }) => _ds.askDesignRevision(consultationId, designDocumentId, notes);

  @override
  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  }) => _ds.getDesignDocumentVersions(
    consultationId: consultationId,
    documentType: documentType,
  );

  @override
  Future<Result<DownloadedFile, Failure>> downloadDesignVersionZip(
    String version,
    String consultationId,
  ) => _ds.downloadVersionZip(version, consultationId);
}
