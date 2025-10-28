// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/consultation/start_revision_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';

class StartRevisionParams {
  final String consultationId;
  final String? notes;

  StartRevisionParams({required this.consultationId, this.notes});
}

class StartRevisionUseCase extends UseCase<Consultation, StartRevisionParams> {
  final ConsultationRepository _repository;

  StartRevisionUseCase(this._repository);

  @override
  Future<Result<Consultation, Failure>> call(StartRevisionParams params) {
    return _repository.startRevision(
      params.consultationId,
      notes: params.notes,
    );
  }
}
