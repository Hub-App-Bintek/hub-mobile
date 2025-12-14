import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/consultation/consultation_network_data_source.dart';
import 'package:pkp_hub/data/models/request/accept_consultation_request.dart';
import 'package:pkp_hub/data/models/request/cancel_consultation_request.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/response/consultation_details_response.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

abstract class ConsultationRepository {
  // Read
  Future<Result<ConsultationsResponse, Failure>> getConsultations({
    String? status,
    int? page,
  });
  Future<Result<ConsultationDetailsResponse, Failure>> getConsultationDetail(
    String consultationId,
  );

  // Write / Actions
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

  Future<Result<Consultation, Failure>> rejectConsultation(
    String consultationId,
  );
}

class ConsultationRepositoryImpl implements ConsultationRepository {
  final ConsultationNetworkDataSource _dataSource;

  ConsultationRepositoryImpl(this._dataSource);

  // --- Read ---
  @override
  Future<Result<ConsultationsResponse, Failure>> getConsultations({
    String? status,
    int? page,
  }) {
    return _dataSource.getConsultations(status: status, page: page);
  }

  @override
  Future<Result<ConsultationDetailsResponse, Failure>> getConsultationDetail(
    String consultationId,
  ) {
    return _dataSource.getConsultationDetail(consultationId);
  }

  // --- Actions ---
  @override
  Future<Result<CreateConsultationResponse, Failure>> createConsultation(
    CreateConsultationRequest request,
  ) {
    return _dataSource.createConsultation(request);
  }

  @override
  Future<Result<Consultation, Failure>> acceptConsultation(
    String consultationId,
    AcceptConsultationRequest request,
  ) {
    return _dataSource.acceptConsultation(consultationId, request);
  }

  @override
  Future<Result<Consultation, Failure>> cancelConsultation(
    String consultationId,
    CancelConsultationRequest request,
  ) {
    return _dataSource.cancelConsultation(consultationId, request);
  }

  @override
  Future<Result<Consultation, Failure>> rejectConsultation(
    String consultationId,
  ) {
    return _dataSource.rejectConsultation(consultationId);
  }
}
