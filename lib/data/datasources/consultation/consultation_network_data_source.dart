// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/data/datasources/consultation/consultation_network_data_source.dart
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/consultation_api_service.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

abstract class ConsultationNetworkDataSource {
  // Read
  Future<Result<List<Consultation>, Failure>> getConsultations();
  Future<Result<Consultation, Failure>> getConsultationDetail(
    String consultationId,
  );

  // Write / Actions
  Future<Result<CreateConsultationResponse, Failure>> createConsultation(
    CreateConsultationRequest request,
  );
  Future<Result<Consultation, Failure>> acceptConsultation(
    String consultationId,
  );
  Future<Result<Consultation, Failure>> rejectConsultation(
    String consultationId,
  );
  Future<Result<Consultation, Failure>> startActiveConsultation(
    String consultationId,
  );
  Future<Result<Consultation, Failure>> startRevision(
    String consultationId, {
    String? notes,
  });
  Future<Result<Consultation, Failure>> finalizeConsultation(
    String consultationId,
  );
}

class ConsultationNetworkDataSourceImpl
    implements ConsultationNetworkDataSource {
  final ApiClient _apiClient;
  final ConsultationApiService _consultationApi;

  ConsultationNetworkDataSourceImpl(this._apiClient, this._consultationApi);

  // --- Read ---
  @override
  Future<Result<List<Consultation>, Failure>> getConsultations() async {
    try {
      final res = await _consultationApi.getConsultations();
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
  Future<Result<Consultation, Failure>> getConsultationDetail(
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

  // --- Actions ---
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
  ) async {
    try {
      final res = await _consultationApi.acceptConsultation(consultationId);
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
  Future<Result<Consultation, Failure>> rejectConsultation(
    String consultationId,
  ) async {
    try {
      final res = await _consultationApi.rejectConsultation(consultationId);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse reject consultation response: $e',
        ),
      );
    }
  }

  @override
  Future<Result<Consultation, Failure>> startActiveConsultation(
    String consultationId,
  ) async {
    try {
      final res = await _consultationApi.startActiveConsultation(
        consultationId,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse start active consultation response: $e',
        ),
      );
    }
  }

  @override
  Future<Result<Consultation, Failure>> startRevision(
    String consultationId, {
    String? notes,
  }) async {
    try {
      final res = await _consultationApi.startRevision(consultationId, notes);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse start revision response: $e'),
      );
    }
  }

  @override
  Future<Result<Consultation, Failure>> finalizeConsultation(
    String consultationId,
  ) async {
    try {
      final res = await _consultationApi.finalizeConsultation(consultationId);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(
          message: 'Failed to parse finalize consultation response: $e',
        ),
      );
    }
  }
}
