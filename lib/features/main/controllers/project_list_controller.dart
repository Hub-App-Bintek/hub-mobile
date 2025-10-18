import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';

class ProjectListController extends BaseController {
  final GetProjectListUseCase getProjectListUseCase;

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var projects = <Project>[].obs;

  int currentPage = 0;
  final int pageSize = 10;
  bool hasMore = true;

  ProjectListController(this.getProjectListUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchProjectList(page: currentPage, size: pageSize);
  }

  Future<void> fetchProjectList({
    required int page,
    required int size,
    String? type,
    String? status,
    bool isRefresh = false,
  }) async {
    if (isLoading.value) return;
    isLoading.value = true;
    error.value = null;
    final request = GetProjectsRequest(
      page: page,
      size: size,
      type: type,
      status: status,
    );
    await handleAsync<GetProjectsResponse>(
      () => getProjectListUseCase(request),
      onSuccess: (data) {
        if (isRefresh) {
          projects.value = data.projects;
        } else {
          projects.addAll(data.projects);
        }
        hasMore = data.projects.length == size;
        isLoading.value = false;
      },
      onFailure: (failure) {
        error.value = failure;
        isLoading.value = false;
        showError(failure);
      },
    );
  }

  Future<void> refreshProjects() async {
    currentPage = 1;
    hasMore = true;
    await fetchProjectList(page: currentPage, size: pageSize, isRefresh: true);
  }

  Future<void> loadMoreProjects() async {
    if (!hasMore || isLoading.value) return;
    currentPage++;
    await fetchProjectList(page: currentPage, size: pageSize);
  }
}
