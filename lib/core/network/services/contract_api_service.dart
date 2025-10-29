import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:retrofit/retrofit.dart';

part 'contract_api_service.g.dart';

@RestApi()
abstract class ContractApiService {
  factory ContractApiService(Dio dio, {String? baseUrl}) = _ContractApiService;

  @GET(ApiEndpoints.contractByConsultation)
  Future<Contract> getContract(@Path('consultationId') String consultationId);

  @PATCH(ApiEndpoints.contractSign)
  Future<Contract> signContract(@Path('contractId') String contractId);

  @PATCH(ApiEndpoints.contractReject)
  Future<Contract> rejectContract(@Path('contractId') String contractId);
}
