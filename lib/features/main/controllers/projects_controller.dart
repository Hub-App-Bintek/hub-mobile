import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';

class ProjectsController extends BaseController {
  final UserStorage _userStorage;
  final GetConsultationsUseCase _getConsultationsUseCase;
  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;

  final Rxn<ConsultationFilterStatus> _consultationStatus =
      Rxn<ConsultationFilterStatus>();
  final Rx<UserRole> userRole = UserRole.unknown.obs;

  ConsultationFilterStatus? get consultationFilterStatus =>
      _consultationStatus.value;

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var projects = <Project>[].obs;
  final RxMap<String, int> projectCounts = <String, int>{}.obs;

  int currentPage = 0;
  bool initialFetchDone = false;
  bool hasMore = true;

  final Rx<ProjectType> _selectedType = consultation.obs;

  ProjectType get selectedType => _selectedType.value;

  ProjectsController(
    this._userStorage,
    this._getConsultationsUseCase,
    this._createDirectChatRoomUseCase,
  ) {
    _consultationStatus.value = consultationFilterInProgress;
  }

  @override
  void onInit() {
    super.onInit();
    _loadRole();
    refreshConsultations();
  }

  void onPageVisible() {
    _loadRole();
    refreshConsultations();
  }

  Future<void> _loadRole() async {
    final role = await _userStorage.getRole();
    if (role != null) {
      userRole.value = role;
    }
  }

  Future<void> _fetchConsultations({
    required int page,
    ConsultationFilterStatus? status,
    bool isRefresh = false,
  }) async {
    isLoading.value = true;
    await handleAsync<ConsultationsResponse>(
      () => _getConsultationsUseCase(
        GetConsultationsParams(status: status?.id, page: page),
      ),
      onSuccess: (response) {
        if (isRefresh) {
          projects
            ..clear()
            ..addAll(response.projects?.content ?? []);
        } else {
          projects.addAll(response.projects?.content ?? []);
        }
        final isLast = response.projects?.last ?? true;
        hasMore = !isLast;
        projectCounts.assignAll({
          consultationFilterInProgress.id: response.inProgressCount ?? 0,
          consultationFilterWaitingConfirmation.id: response.pendingCount ?? 0,
          consultationFilterDone.id: response.doneCount ?? 0,
        });
      },
      onFailure: (failure) {
        showError(failure);
        projects.clear();
        hasMore = false;
      },
    );
    isLoading.value = false;
  }

  Future<void> refreshConsultations() async {
    if (isLoading.value) return;
    initialFetchDone = true;
    currentPage = 0;
    hasMore = true;
    projects.clear();
    await _fetchConsultations(
      page: currentPage,
      isRefresh: true,
      status: consultationFilterStatus,
    );
  }

  void updateConsultationStatusFilter(ConsultationFilterStatus? status) {
    _consultationStatus.value = status;
    refreshConsultations();
  }

  void updateCategory(ProjectType projectType) {
    if (_selectedType.value == projectType) return;
    _selectedType.value = projectType;

    switch (_selectedType.value) {
      case consultation:
        refreshConsultations();
        break;
      case licensing:
        // TODO: Fetch licensing projects
        break;
      case construction:
        // TODO: Fetch construction projects
        break;
      case monitoring:
        // TODO: Fetch monitoring projects
        break;
    }
  }

  Future<void> loadMoreProjects() async {
    if (!hasMore || isLoading.value || !initialFetchDone) return;
    currentPage++;
    await _fetchConsultations(
      page: currentPage,
      status: _consultationStatus.value,
    );
  }

  void openConsultationDetails(Project project) {
    navigateTo(
      AppRoutes.consultationDetails,
      arguments: ConsultationDetailsArgs(project: project),
    );
  }

  void openConsultationConfirmation(Project project) {
    navigateTo(
      AppRoutes.consultationConfirmation,
      arguments: ConsultationDetailsArgs(project: project),
    );
  }

  Future<void> openChat(Project project) async {
    final int? userId = (userRole.value == UserRole.homeowner)
        ? project.consultationInfo?.consultantId
        : project.consultationInfo?.homeOwnerId;
    final String userName = (userRole.value == UserRole.homeowner)
        ? project.consultationInfo?.consultantName ?? ''
        : project.consultationInfo?.homeOwnerName ?? '';

    if (userId == null) {
      showError(const ServerFailure(message: 'ID User tidak tersedia'));
      return;
    }

    await handleAsync<CreateChatRoomResponse>(
      () => _createDirectChatRoomUseCase(userId),
      onSuccess: (room) {
        navigateTo(
          AppRoutes.chat,
          arguments: ChatArgs(name: userName, roomId: room.id),
        );
      },
      onFailure: showError,
    );
  }

  // TODO: Update to licensing object
  void openLicensingDetails(Project consultation) {
    navigateTo(
      AppRoutes.licensingDetails,
      arguments: {'projectId': 'c05f794d-b6ee-49bc-a3d5-63a36529a882'},
    );
  }

  // TODO: Update to monitoring object
  void openMonitoringDetails(Project consultation) {
    navigateTo(
      AppRoutes.monitoringDetail,
      arguments: ConstructionSupervisor(
        id: 5,
        name: 'Danu Pranata',
        specialization: 'Ahli Sipil Ahli Konstruksi',
        price: 18,
        distance: 7,
      ),
    );
  }
}
