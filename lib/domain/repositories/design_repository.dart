// Design repository for prototype designs catalog
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/design/design_network_data_source.dart'
    as designds;
import 'package:pkp_hub/data/models/prototype_design.dart';

abstract class DesignRepository {
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns();
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(String id);
  Future<Result<DownloadedFile, Failure>> downloadPrototypeDesign(String id);
}

class DesignRepositoryImpl implements DesignRepository {
  final designds.DesignNetworkDataSource _ds;
  DesignRepositoryImpl(this._ds);

  @override
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns() =>
      _ds.getPrototypeDesigns();

  @override
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(String id) =>
      _ds.getPrototypeDesignById(id);

  @override
  Future<Result<DownloadedFile, Failure>> downloadPrototypeDesign(String id) =>
      _ds.downloadPrototypeDesign(id);
}
