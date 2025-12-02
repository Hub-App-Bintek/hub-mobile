// lib/domain/usecases/permit/submit_simbg_form_use_case.dart

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/submit_simbg_request.dart';
import 'package:pkp_hub/domain/repositories/permit_repository.dart';
import 'package:pkp_hub/core/network/result.dart';

class SubmitSimbgFormUseCase extends UseCase<void, SubmitSimbgFormParams> {
  final PermitRepository _repository;

  SubmitSimbgFormUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(SubmitSimbgFormParams params) async {
    return _repository.submitSimbgForm(
      projectId: params.projectId,
      request: params.request,
    );
  }
}

class SubmitSimbgFormParams {
  final String projectId;
  final SubmitSimbgRequest request;

  SubmitSimbgFormParams({required this.projectId, required this.request});
}
