import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/consultation/consultation_network_data_source.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

abstract class ConsultationRepository {
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

class ConsultationRepositoryImpl implements ConsultationRepository {
  final ConsultationNetworkDataSource _dataSource;

  ConsultationRepositoryImpl(this._dataSource);

  // --- Read ---
  @override
  Future<Result<List<Consultation>, Failure>> getConsultations() {
    return _dataSource.getConsultations();
  }

  @override
  Future<Result<Consultation, Failure>> getConsultationDetail(
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
  ) {
    return _dataSource.acceptConsultation(consultationId);
  }

  @override
  Future<Result<Consultation, Failure>> rejectConsultation(
    String consultationId,
  ) {
    return _dataSource.rejectConsultation(consultationId);
  }

  @override
  Future<Result<Consultation, Failure>> startActiveConsultation(
    String consultationId,
  ) {
    return _dataSource.startActiveConsultation(consultationId);
  }

  @override
  Future<Result<Consultation, Failure>> startRevision(
    String consultationId, {
    String? notes,
  }) {
    return _dataSource.startRevision(consultationId, notes: notes);
  }

  @override
  Future<Result<Consultation, Failure>> finalizeConsultation(
    String consultationId,
  ) {
    return _dataSource.finalizeConsultation(consultationId);
  }
}
