import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';

class ProjectsController extends BaseController with WidgetsBindingObserver {
  final GetProjectsUseCase getProjectsUseCase;
  Worker? _mainTabWorker;

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var projects = <Project>[].obs;

  int currentPage = 0;
  final int pageSize = 100;
  bool hasMore = true;

  ProjectsController(this.getProjectsUseCase);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _listenToMainTabChanges();
    fetchProjectList(page: currentPage, size: pageSize);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _mainTabWorker?.dispose();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Refresh when app comes back to foreground and this tab may be visible
      refreshProjects();
    }
  }

  void _listenToMainTabChanges() {
    if (!Get.isRegistered<MainController>()) return;
    final mainController = Get.find<MainController>();
    _mainTabWorker = ever<int>(mainController.selectedIndex, (index) {
      if (index == 1) {
        refreshProjects();
      }
    });
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
      () => getProjectsUseCase(request),
      onSuccess: (data) {
        if (isRefresh) {
          // Ensure we replace with a mutable list to avoid unmodifiable list issues
          projects.value = List<Project>.from(data.projects);
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
    currentPage = 0;
    hasMore = true;
    // Do not clear here to avoid touching a potentially unmodifiable list.
    await fetchProjectList(page: currentPage, size: pageSize, isRefresh: true);
  }

  Future<void> loadMoreProjects() async {
    if (!hasMore || isLoading.value) return;
    currentPage++;
    await fetchProjectList(page: currentPage, size: pageSize);
  }

  void checkProjectStatus(Project project) {
    if (project.status == "CREATED") {
      navigateTo(
        AppRoutes.consultants,
        arguments: {
          'projectId': project.projectId,
          'lat': project.location?.latitude ?? 0.0,
          'long': project.location?.longitude ?? 0.0,
        },
      );
    } else {
      navigateTo(
        AppRoutes.projectDetails,
        arguments: {
          'projectId': project.projectId,
          'homeOwnerId': project.homeOwnerId,
          'homeOwnerName': project.homeOwnerName,
          'consultantId': project.consultantId,
          'consultantName': project.consultantName,
        },
      );
    }
  }
}
