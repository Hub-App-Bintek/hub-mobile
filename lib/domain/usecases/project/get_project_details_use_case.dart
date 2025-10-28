import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';

class GetProjectDetailsUseCase extends UseCase<ProjectDetailsResponse, String> {
  final ProjectRepository _repository;

  GetProjectDetailsUseCase(this._repository);

  @override
  Future<Result<ProjectDetailsResponse, Failure>> call(String projectId) {
    return _repository.getProjectDetail(projectId);
  }
}
