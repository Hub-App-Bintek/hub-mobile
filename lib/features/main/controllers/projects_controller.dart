import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/consultation_info.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/project_location.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';

class ProjectsController extends BaseController {
  final GetProjectsUseCase getProjectsUseCase;
  final String? projectStatus;
  final UserStorage _userStorage;
  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;

  final RxnString _statusFilter = RxnString();
  final Rx<UserRole> userRole = UserRole.unknown.obs;

  String? get statusFilter => _statusFilter.value;

  var isLoading = false.obs;
  var error = Rxn<Failure>();
  var projects = <Project>[].obs;

  final RxMap<String, int> projectCounts = <String, int>{}.obs;

  final _allProjects = <Project>[].obs;

  int currentPage = 0;
  final int pageSize = 100;
  bool hasMore = true;

  final RxString _selectedCategory = 'Konsultasi'.obs;

  String get selectedCategory => _selectedCategory.value;

  ProjectsController(
    this.getProjectsUseCase,
    this.projectStatus,
    this._userStorage,
    this._createDirectChatRoomUseCase,
  ) {
    if (projectStatus != null) {
      _statusFilter.value = projectStatus;
    } else {
      _statusFilter.value = 'ACTIVE';
    }
  }

  @override
  void onResumed() {
    super.onResumed();
    _loadRole();
    _seedMockProjects();
    projects.value = _allProjects
        .where((p) => p.status == _statusFilter.value)
        .toList();
    // refreshProjects();
    _updateProjectCounts();
  }

  void onPageVisible() {
    _loadRole();
    _seedMockProjects();
    projects.value = _allProjects
        .where((p) => p.status == _statusFilter.value)
        .toList();
    _updateProjectCounts();
  }

  @override
  void onInit() {
    super.onInit();
    _loadRole();
  }

  Future<void> _loadRole() async {
    final role = await _userStorage.getRole();
    if (role != null) {
      userRole.value = role;
    }
  }

  void _updateProjectCounts() {
    final counts = <String, int>{'ACTIVE': 0, 'PENDING': 0, 'COMPLETED': 0};
    for (var project in _allProjects) {
      if (counts.containsKey(project.status)) {
        counts[project.status!] = counts[project.status]! + 1;
      }
    }
    projectCounts.assignAll(counts);
  }

  Future<void> fetchProjectList({
    required int page,
    required int size,
    String? type,
    String? status,
    bool isRefresh = false,
  }) async {
    // API temporarily bypassed: always use mock projects.
    if (isRefresh) {
      _seedMockProjects();
    }
    projects.value = _allProjects
        .where((p) => p.status == _statusFilter.value)
        .toList();
    hasMore = false;
    isLoading.value = false;
    _updateProjectCounts();
  }

  Future<void> refreshProjects() async {
    currentPage = 0;
    hasMore = true;
    // Do not clear here to avoid touching a potentially unmodifiable list.
    if (projectStatus != null) {
      await fetchProjectList(
        page: currentPage,
        size: pageSize,
        isRefresh: true,
        status: projectStatus,
      );
    } else {
      await fetchProjectList(
        page: currentPage,
        size: pageSize,
        isRefresh: true,
      );
    }
  }

  void updateStatusFilter(String? status, {bool refresh = true}) {
    if (_statusFilter.value == status) return;
    _statusFilter.value = status;
    if (_allProjects.isNotEmpty) {
      projects.value = _allProjects
          .where((p) => p.status == _statusFilter.value)
          .toList();
      _updateProjectCounts();
      if (!refresh) return;
    }
    if (refresh) {
      refreshProjects();
    }
  }

  void updateCategory(String category) {
    if (_selectedCategory.value == category) return;
    _selectedCategory.value = category;

    final defaultStatus = _defaultStatusForCategory(category);
    if (_statusFilter.value != defaultStatus) {
      updateStatusFilter(defaultStatus);
    } else {
      refreshProjects();
    }
  }

  Future<void> loadMoreProjects() async {
    if (!hasMore || isLoading.value) return;
    currentPage++;
    await fetchProjectList(page: currentPage, size: pageSize);
  }

  void openProjectReview(Project project) {
    navigateTo(
      AppRoutes.projectReview,
      arguments: ProjectReviewArgs(project: project),
    );
  }

  void openConsultationDetails(Project project) {
    navigateTo(
      AppRoutes.consultationDetails,
      arguments: ConsultationDetailsArgs(project: project),
    );
  }

  void openConsultationDetailsWithCompletedData(Project project) {
    navigateTo(
      AppRoutes.consultationDetails,
      arguments: ConsultationDetailsArgs(
        project: project.copyWith(projectId: 'A17'),
      ),
    );
  }

  void openConsultationConfirmation(Project project) {
    navigateTo(
      AppRoutes.consultationConfirmation,
      arguments: ConsultationDetailsArgs(project: project),
    );
  }

  Future<void> openChatWithConsultant(Project project) async {
    final consultantId = project.consultationInfo?.consultantId;
    if (consultantId == null) {
      showError(const ServerFailure(message: 'ID konsultan tidak tersedia'));
      return;
    }
    final consultantName =
        project.consultationInfo?.consultantName?.trim() ??
        project.consultationInfo?.consultantName?.trim();
    await handleAsync<CreateChatRoomResponse>(
      () => _createDirectChatRoomUseCase(consultantId),
      onSuccess: (room) {
        navigateTo(
          AppRoutes.chat,
          arguments: ChatArgs(
            name: consultantName?.isNotEmpty == true
                ? consultantName
                : 'Konsultan',
            roomId: room.id,
          ),
        );
      },
      onFailure: showError,
    );
  }

  void openLicensingDetails(Project project) {
    navigateTo(
      AppRoutes.licensingDetails,
      arguments: {'projectId': 'c05f794d-b6ee-49bc-a3d5-63a36529a882'},
    );
  }

  void openPengawasanDetails(Project project) {
    navigateTo(
      AppRoutes.monitoringDetail,
      arguments: ConstructionSupervisor(
        id: '5',
        name: 'Danu Pranata',
        specialization: 'Ahli Sipil Ahli Konstruksi',
        priceJuta: 18,
        distanceKm: 7,
      ),
    );
  }

  void _seedMockProjects() {
    _allProjects
      ..clear()
      ..addAll(_mockProjects);
  }

  String? _defaultStatusForCategory(String category) {
    switch (category) {
      case 'Konstruksi':
        return null;
      default:
        return 'ACTIVE';
    }
  }
}

// Mocked consultations to use when backend data is unavailable.
const List<Project> _mockProjects = [
  // ACTIVE scenarios
  Project(
    projectId: 'A0',
    name: 'Renovasi rumah BSD',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Dian Pratama',
      consultantId: 1001,
      consultantName: 'Ir. Ahmad Wijaya',
    ),
    location: ProjectLocation(address: 'BSD, Tangerang Selatan'),
  ),
  Project(
    projectId: 'A1',
    name: 'Desain interior Kemang',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Rani Kusuma',
      consultantId: 1001,
      consultantName: 'Salsa Putri, ST',
    ),
    location: ProjectLocation(address: 'Kemang, Jakarta Selatan'),
  ),
  Project(
    projectId: 'A2',
    name: 'Tata ulang kafe Depok',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Fajar Setiawan',
      consultantId: 1001,
      consultantName: 'Dimas Wibowo',
    ),
    location: ProjectLocation(address: 'Depok, Jawa Barat'),
  ),
  Project(
    projectId: 'A3',
    name: 'Rumah modern Bandung',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Sari Anggraini',
      consultantId: 1001,
      consultantName: 'Alya Nabila',
    ),
    location: ProjectLocation(address: 'Bandung, Jawa Barat'),
  ),
  Project(
    projectId: 'A4',
    name: 'Ruko Surabaya',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Hendra Wijaya',
      consultantId: 1001,
      consultantName: 'Budi Santoso',
    ),
    location: ProjectLocation(address: 'Surabaya, Jawa Timur'),
  ),
  Project(
    projectId: 'A5',
    name: 'Renovasi dapur Bekasi',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Lilis Hartati',
      consultantId: 1001,
      consultantName: 'Nadia Farah',
    ),
    location: ProjectLocation(address: 'Bekasi, Jawa Barat'),
  ),
  Project(
    projectId: 'A6',
    name: 'Villa Bogor',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Galih Raharjo',
      consultantId: 1001,
      consultantName: 'Rio Prabowo',
    ),
    location: ProjectLocation(address: 'Bogor, Jawa Barat'),
  ),
  Project(
    projectId: 'A7',
    name: 'Rumah keluarga Cibubur',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Maya Salsabila',
      consultantId: 1001,
      consultantName: 'Sinta Maharani',
    ),
    location: ProjectLocation(address: 'Cibubur, Jawa Barat'),
  ),
  Project(
    projectId: 'A8',
    name: 'Rumah minimalis Serpong',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Arif Pratomo',
      consultantId: 1001,
      consultantName: 'Yusuf Aditya',
    ),
    location: ProjectLocation(address: 'Serpong, Banten'),
  ),
  Project(
    projectId: 'A9',
    name: 'Gudang Cilegon',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Nia Lestari',
      consultantId: 1001,
      consultantName: 'Mega Lestari',
    ),
    location: ProjectLocation(address: 'Cilegon, Banten'),
  ),
  Project(
    projectId: 'A10',
    name: 'Homestay Yogyakarta',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Bagus Aditya',
      consultantId: 1001,
      consultantName: 'Gilang Saputra',
    ),
    location: ProjectLocation(address: 'Yogyakarta'),
  ),
  Project(
    projectId: 'A11',
    name: 'Townhouse Semarang',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Yulia Kartika',
      consultantId: 1001,
      consultantName: 'Fitri Handayani',
    ),
    location: ProjectLocation(address: 'Semarang, Jawa Tengah'),
  ),
  Project(
    projectId: 'A12',
    name: 'Guesthouse Malang',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Rico Prabowo',
      consultantId: 1001,
      consultantName: 'Indra Kurniawan',
    ),
    location: ProjectLocation(address: 'Malang, Jawa Timur'),
  ),
  Project(
    projectId: 'A13',
    name: 'Villa Bali',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Putri Rahayu',
      consultantId: 1001,
      consultantName: 'Clara Widjaja',
    ),
    location: ProjectLocation(address: 'Bali'),
  ),
  Project(
    projectId: 'A14',
    name: 'Perumahan Makassar',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Reza Mahendra',
      consultantId: 1001,
      consultantName: 'Rama Wijaya',
    ),
    location: ProjectLocation(address: 'Makassar'),
  ),
  Project(
    projectId: 'A15',
    name: 'Ruko Medan',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Dewi Ayu',
      consultantId: 1001,
      consultantName: 'Putri Anggraini',
    ),
    location: ProjectLocation(address: 'Medan'),
  ),
  Project(
    projectId: 'A16',
    name: 'Kantor Padang',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Bramantyo Saputra',
      consultantId: 1001,
      consultantName: 'Adi Rahman',
    ),
    location: ProjectLocation(address: 'Padang'),
  ),
  Project(
    projectId: 'A17',
    name: 'Cafe Pontianak',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Nadya Paramita',
      consultantId: 1001,
      consultantName: 'Laras Pangestu',
    ),
    location: ProjectLocation(address: 'Pontianak'),
  ),
  // PENDING
  Project(
    projectId: 'P1',
    name: 'Rumah dua lantai Cirebon',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Fikri Ramadhan',
      consultantId: 1001,
      consultantName: 'Tia Safitri',
    ),
    location: ProjectLocation(address: 'Cirebon'),
  ),
  Project(
    projectId: 'P2',
    name: 'Renovasi Solo',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Anita Rahmi',
      consultantId: 1001,
      consultantName: 'Johan Prasetyo',
    ),
    location: ProjectLocation(address: 'Solo'),
  ),
  Project(
    projectId: 'P3',
    name: 'Desain toko Sukabumi',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Dodi Saputra',
      consultantId: 1001,
      consultantName: 'Dewi Paramita',
    ),
    location: ProjectLocation(address: 'Sukabumi'),
  ),
  // COMPLETED
  Project(
    projectId: 'C1',
    name: 'Renovasi dapur Palembang',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Citra Wulandari',
      consultantId: 1001,
      consultantName: 'Rizky Alamsyah',
    ),
    location: ProjectLocation(address: 'Palembang'),
  ),
  Project(
    projectId: 'C2',
    name: 'Villa Manado',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Adrian Susanto',
      consultantId: 1001,
      consultantName: 'Zahra Kamila',
    ),
    location: ProjectLocation(address: 'Manado'),
  ),
  Project(
    projectId: 'C3',
    name: 'Kantor Bandar Lampung',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(
      homeOwnerName: 'Hana Fauzia',
      consultantId: 1001,
      consultantName: 'Farhan Akbar',
    ),
    location: ProjectLocation(address: 'Bandar Lampung'),
  ),
];
