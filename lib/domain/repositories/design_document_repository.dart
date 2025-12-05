import 'package:dio/dio.dart';
import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/design_document/design_document_network_data_source.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';

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

  Future<Result<void, Failure>> approveDesignDocuments(String designDocumentId);
  Future<Result<void, Failure>> askDesignRevision({
    required String designDocumentId,
    String? notes,
  });

  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  });

  Future<Result<DownloadedFile, Failure>> downloadDesignVersionZip(
    String version,
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
  Future<Result<void, Failure>> approveDesignDocuments(
    String designDocumentId,
  ) => _ds.approveDesignDocuments(designDocumentId);

  @override
  Future<Result<void, Failure>> askDesignRevision({
    required String designDocumentId,
    String? notes,
  }) => _ds.askDesignRevision(designDocumentId, notes: notes);

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
  ) => _ds.downloadVersionZip(version);
}
