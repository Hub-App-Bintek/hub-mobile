import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';

class GetProjectV2UseCase extends UseCase<ProjectDetailsResponse, String> {
  GetProjectV2UseCase(this._repository);

  final ProjectRepository _repository;

  @override
  Future<Result<ProjectDetailsResponse, Failure>> call(String projectId) {
    return _repository.getProjectV2(projectId);
  }
}
