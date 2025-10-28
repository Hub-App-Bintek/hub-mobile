import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/final_document/final_document_network_data_source.dart';
import 'package:pkp_hub/data/models/final_document.dart';

abstract class FinalDocumentRepository {
  Future<Result<FinalDocument, Failure>> uploadFinalDocuments({
    required String consultationId,
    required String fileDedUrl,
    required String fileRabUrl,
    required String fileSpektekUrl,
  });

  Future<Result<Response<List<int>>, Failure>> downloadFinalDocument(
    String documentId,
  );

  Future<Result<void, Failure>> approveFinalDocuments(String consultationId);
  Future<Result<void, Failure>> rejectFinalDocuments(
    String consultationId, {
    String? notes,
  });
}

class FinalDocumentRepositoryImpl implements FinalDocumentRepository {
  final FinalDocumentNetworkDataSource _ds;
  FinalDocumentRepositoryImpl(this._ds);

  @override
  Future<Result<FinalDocument, Failure>> uploadFinalDocuments({
    required String consultationId,
    required String fileDedUrl,
    required String fileRabUrl,
    required String fileSpektekUrl,
  }) => _ds.uploadFinalDocuments(
    consultationId: consultationId,
    fileDedUrl: fileDedUrl,
    fileRabUrl: fileRabUrl,
    fileSpektekUrl: fileSpektekUrl,
  );

  @override
  Future<Result<Response<List<int>>, Failure>> downloadFinalDocument(
    String documentId,
  ) => _ds.downloadFinalDocument(documentId);

  @override
  Future<Result<void, Failure>> approveFinalDocuments(String consultationId) =>
      _ds.approveFinalDocuments(consultationId);

  @override
  Future<Result<void, Failure>> rejectFinalDocuments(
    String consultationId, {
    String? notes,
  }) => _ds.rejectFinalDocuments(consultationId, notes: notes);
}
