import 'package:pkp_hub/core/enums/legal_document_type.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/legal/legal_network_data_source.dart';

abstract class LegalRepository {
  Future<Result<String, Failure>> getDocument(LegalDocumentType type);
}

class LegalRepositoryImpl implements LegalRepository {
  LegalRepositoryImpl(this._networkDataSource);

  final LegalNetworkDataSource _networkDataSource;

  @override
  Future<Result<String, Failure>> getDocument(LegalDocumentType type) {
    return _networkDataSource.getDocument(type.id);
  }
}
