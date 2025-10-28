import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/revision/revision_network_data_source.dart'
    as revds;
import 'package:pkp_hub/data/models/request/create_revision_request.dart';
import 'package:pkp_hub/data/models/revision.dart';

abstract class RevisionRepository {
  Future<Result<Revision, Failure>> createRevision(
    String consultationId,
    CreateRevisionRequest request,
  );
  Future<Result<List<Revision>, Failure>> getRevisions(String consultationId);
}

class RevisionRepositoryImpl implements RevisionRepository {
  final revds.RevisionNetworkDataSource _ds;
  RevisionRepositoryImpl(this._ds);

  @override
  Future<Result<Revision, Failure>> createRevision(
    String consultationId,
    CreateRevisionRequest request,
  ) => _ds.createRevision(consultationId, request);

  @override
  Future<Result<List<Revision>, Failure>> getRevisions(String consultationId) =>
      _ds.getRevisions(consultationId);
}
