import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet_api_service.g.dart';

@RestApi()
abstract class WalletApiService {
  factory WalletApiService(Dio dio, {String? baseUrl}) = _WalletApiService;

  @GET(ApiEndpoints.walletBalance)
  Future<WalletResponse> getWalletBalance();
}
