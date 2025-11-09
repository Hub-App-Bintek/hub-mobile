import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';

class CreateProjectUseCase
    extends UseCase<CreateProjectResponse, CreateProjectParams> {
  final ProjectRepository repository;

  CreateProjectUseCase(this.repository);

  @override
  Future<Result<CreateProjectResponse, Failure>> call(
    CreateProjectParams params,
  ) {
    return repository.createProject(
      params.request,
      incomeProofFile: params.incomeProofFile,
    );
  }
}

class CreateProjectParams {
  CreateProjectParams({required this.request, this.incomeProofFile});

  final CreateProjectRequest request;
  final File? incomeProofFile;
}
