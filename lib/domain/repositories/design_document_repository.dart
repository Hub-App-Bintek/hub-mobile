import 'package:dio/dio.dart';
import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/design_document/design_document_network_data_source.dart';
import 'package:pkp_hub/data/models/design_document.dart';

abstract class DesignDocumentRepository {
  Future<Result<DesignDocument, Failure>> uploadDesignDocuments({
    required String consultationId,
    required File fileDed,
    required File fileRab,
    required File fileBoq,
  });

  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  );

  Future<Result<void, Failure>> approveDesignDocuments(String designDocumentId);
  Future<Result<void, Failure>> askDesignRevision({
    required String designDocumentId,
    String? notes,
  });
}

class DesignDocumentRepositoryImpl implements DesignDocumentRepository {
  final DesignDocumentNetworkDataSource _ds;
  DesignDocumentRepositoryImpl(this._ds);

  @override
  Future<Result<DesignDocument, Failure>> uploadDesignDocuments({
    required String consultationId,
    required File fileDed,
    required File fileRab,
    required File fileBoq,
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
}
