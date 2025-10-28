import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';

class CreateProjectUseCase
    extends UseCase<CreateProjectResponse, CreateProjectRequest> {
  final ProjectRepository repository;

  CreateProjectUseCase(this.repository);

  @override
  Future<Result<CreateProjectResponse, Failure>> call(
    CreateProjectRequest request,
  ) {
    return repository.createProject(request);
  }
}
