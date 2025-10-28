import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';

class GetProjectsUseCase
    extends UseCase<GetProjectsResponse, GetProjectsRequest> {
  final ProjectRepository _repository;

  GetProjectsUseCase(this._repository);

  @override
  Future<Result<GetProjectsResponse, Failure>> call(
    GetProjectsRequest request,
  ) {
    return _repository.getProjectList(request);
  }
}
