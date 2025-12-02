// lib/domain/usecases/permit/get_permit_status_use_case.dart

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart'; // Or your Result class
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/permit_status_response.dart';
import 'package:pkp_hub/domain/repositories/permit_repository.dart';

class GetPermitStatusUseCase extends UseCase<PermitStatusResponse, String> {
  final PermitRepository _repository;

  GetPermitStatusUseCase(this._repository);

  // The parameter is the projectId (a String)
  @override
  Future<Result<PermitStatusResponse, Failure>> call(String params) async {
    return _repository.getPermitStatus(projectId: params);
  }
}

// You would also need to add the corresponding method to your PermitRepository
// and its implementation, PermitRepositoryImpl.
