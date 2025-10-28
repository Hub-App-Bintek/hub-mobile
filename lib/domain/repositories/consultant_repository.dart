import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/consultant/consultant_network_data_source.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';

abstract class ConsultantRepository {
  Future<Result<ConsultantsResponse, Failure>> getConsultants({
    required double lat,
    required double long,
    required int page,
    required int size,
  });

  Future<Result<ConsultantPortfoliosResponse, Failure>>
  getConsultantPortfolios({required String consultantId, int? page, int? size});
}

class ConsultantRepositoryImpl implements ConsultantRepository {
  final ConsultantNetworkDataSource _dataSource;

  ConsultantRepositoryImpl(this._dataSource);

  @override
  Future<Result<ConsultantsResponse, Failure>> getConsultants({
    required double lat,
    required double long,
    required int page,
    required int size,
  }) {
    return _dataSource.getConsultants(
      lat: lat,
      long: long,
      page: page,
      size: size,
    );
  }

  @override
  Future<Result<ConsultantPortfoliosResponse, Failure>>
  getConsultantPortfolios({
    required String consultantId,
    int? page,
    int? size,
  }) {
    return _dataSource.getConsultantPortfolios(
      consultantId: consultantId,
      page: page,
      size: size,
    );
  }
}
