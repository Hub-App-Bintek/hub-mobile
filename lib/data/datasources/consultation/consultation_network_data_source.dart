import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/consultation_api_service.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/accept_consultation_request.dart';
import 'package:pkp_hub/data/models/request/cancel_consultation_request.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/consultation_details_response.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

abstract class ConsultationNetworkDataSource {
  Future<Result<ConsultationsResponse, Failure>> getConsultations({
    String? status,
    int? page,
  });

  Future<Result<ConsultationDetailsResponse, Failure>> getConsultationDetail(
    String consultationId,
  );

  Future<Result<CreateConsultationResponse, Failure>> createConsultation(
    CreateConsultationRequest request,
  );

  Future<Result<Consultation, Failure>> acceptConsultation(
    String consultationId,
    AcceptConsultationRequest request,
  );

  Future<Result<Consultation, Failure>> cancelConsultation(
    String consultationId,
    CancelConsultationRequest request,
  );
}

class ConsultationNetworkDataSourceImpl
    implements ConsultationNetworkDataSource {
  ConsultationNetworkDataSourceImpl(this._apiClient, this._consultationApi);

  final ApiClient _apiClient;
  final ConsultationApiService _consultationApi;

  @override
  Future<Result<ConsultationsResponse, Failure>> getConsultations({
    String? status,
    int? page,
  }) async {
    try {
      final res = await _consultationApi.getConsultations(status, page);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse consultations response: $e'),
      );
    }
  }

  @override
  Future<Result<ConsultationDetailsResponse, Failure>> getConsultationDetail(
    String consultationId,
  ) async {
    try {
      final res = await _consultationApi.getConsultationDetail(consultationId);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse consultation detail: $e'),
      );
    }
  }

  @override
  Future<Result<CreateConsultationResponse, Failure>> createConsultation(
    CreateConsultationRequest request,
  ) async {
    try {
      final res = await _consultationApi.createConsultation(request);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse create consultation response: $e',
        ),
      );
    }
  }

  @override
  Future<Result<Consultation, Failure>> acceptConsultation(
    String consultationId,
    AcceptConsultationRequest request,
  ) async {
    try {
      final res = await _consultationApi.acceptConsultation(
        consultationId,
        request,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse accept consultation response: $e',
        ),
      );
    }
  }

  @override
  Future<Result<Consultation, Failure>> cancelConsultation(
    String consultationId,
    CancelConsultationRequest request,
  ) async {
    try {
      final res = await _consultationApi.cancelConsultation(
        consultationId,
        request,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse cancel consultation response: $e',
        ),
      );
    }
  }
}
