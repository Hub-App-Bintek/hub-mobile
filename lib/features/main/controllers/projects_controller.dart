import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/consultation_info.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/project_location.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';

class ProjectsController extends BaseController {
  final GetProjectsUseCase getProjectsUseCase;
  final String? projectStatus;
  final UserStorage _userStorage;

  final RxnString _statusFilter = RxnString();
  final Rxn<UserRole> userRole = Rxn<UserRole>();

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
    _seedMockProjects();
    projects.value = _allProjects
        .where((p) => p.status == _statusFilter.value)
        .toList();
    // refreshProjects();
    _updateProjectCounts();
  }

  void onPageVisible() {
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
    userRole.value = await _userStorage.getRole();
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

  void openChatWithConsultant(Project project) {
    final consultantName =
        project.consultationInfo?.consultantName?.trim() ??
        project.consultationInfo?.consultantName?.trim();
    navigateTo(
      AppRoutes.chat,
      arguments: ChatArgs(
        name: consultantName?.isNotEmpty == true ? consultantName : 'Konsultan',
      ),
    );
  }

  void _seedMockProjects() {
    _allProjects
      ..clear()
      ..addAll(_mockProjects);
  }
}

// Mocked consultations to use when backend data is unavailable.
const List<Project> _mockProjects = [
  // ACTIVE scenarios
  Project(
    projectId: 'A0',
    name: 'Konsultasi A0 - tanpa kontrak/desain/invoice',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Ir. Ahmad Wijaya'),
    location: ProjectLocation(address: 'BSD, Tangerang Selatan'),
  ),
  Project(
    projectId: 'A1',
    name: 'Konsultasi A1 - kontrak butuh persetujuan',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Salsa Putri, ST'),
    location: ProjectLocation(address: 'Kemang, Jakarta Selatan'),
  ),
  Project(
    projectId: 'A2',
    name: 'Konsultasi A2 - 1 revisi, 1 approval kontrak',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Dimas Wibowo'),
    location: ProjectLocation(address: 'Depok, Jawa Barat'),
  ),
  Project(
    projectId: 'A3',
    name: 'Konsultasi A3 - 2 revisi, 1 approval kontrak',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Alya Nabila'),
    location: ProjectLocation(address: 'Bandung, Jawa Barat'),
  ),
  Project(
    projectId: 'A4',
    name: 'Konsultasi A4 - 3 revisi, 1 approval kontrak',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Budi Santoso'),
    location: ProjectLocation(address: 'Surabaya, Jawa Timur'),
  ),
  Project(
    projectId: 'A5',
    name: 'Konsultasi A5 - 3 revisi, 1 kontrak disetujui (TTD)',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Nadia Farah'),
    location: ProjectLocation(address: 'Bekasi, Jawa Barat'),
  ),
  Project(
    projectId: 'A6',
    name: 'Konsultasi A6 - 3 revisi, kontrak sudah ditandatangani',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Rio Prabowo'),
    location: ProjectLocation(address: 'Bogor, Jawa Barat'),
  ),
  Project(
    projectId: 'A7',
    name: 'Konsultasi A7 - siap approve draft desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Sinta Maharani'),
    location: ProjectLocation(address: 'Cibubur, Jawa Barat'),
  ),
  Project(
    projectId: 'A8',
    name: 'Konsultasi A8 - 1 revisi + 1 approval draft desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Yusuf Aditya'),
    location: ProjectLocation(address: 'Serpong, Banten'),
  ),
  Project(
    projectId: 'A9',
    name: 'Konsultasi A9 - 2 revisi + 1 approval draft desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Mega Lestari'),
    location: ProjectLocation(address: 'Cilegon, Banten'),
  ),
  Project(
    projectId: 'A10',
    name: 'Konsultasi A10 - 3 revisi + 1 approval draft desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Gilang Saputra'),
    location: ProjectLocation(address: 'Yogyakarta'),
  ),
  Project(
    projectId: 'A11',
    name: 'Konsultasi A11 - 3 revisi + 1 approval draft desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Fitri Handayani'),
    location: ProjectLocation(address: 'Semarang, Jawa Tengah'),
  ),
  Project(
    projectId: 'A12',
    name: 'Konsultasi A12 - 3 revisi + 1 draft disetujui',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Indra Kurniawan'),
    location: ProjectLocation(address: 'Malang, Jawa Timur'),
  ),
  Project(
    projectId: 'A13',
    name: 'Konsultasi A13 - 3 revisi + 1 draft disetujui + final desain',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Clara Widjaja'),
    location: ProjectLocation(address: 'Bali'),
  ),
  Project(
    projectId: 'A14',
    name: 'Konsultasi A14 - final desain + invoice (unpaid)',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Rama Wijaya'),
    location: ProjectLocation(address: 'Makassar'),
  ),
  Project(
    projectId: 'A15',
    name: 'Konsultasi A15 - final desain + 1 invoice paid & 1 unpaid',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Putri Anggraini'),
    location: ProjectLocation(address: 'Medan'),
  ),
  Project(
    projectId: 'A16',
    name: 'Konsultasi A16 - final desain + 2 invoice paid & 1 unpaid',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Adi Rahman'),
    location: ProjectLocation(address: 'Padang'),
  ),
  Project(
    projectId: 'A17',
    name: 'Konsultasi A17 - final desain + semua invoice paid',
    status: 'ACTIVE',
    consultationInfo: ConsultationInfo(consultantName: 'Laras Pangestu'),
    location: ProjectLocation(address: 'Pontianak'),
  ),
  // PENDING
  Project(
    projectId: 'P1',
    name: 'Konsultasi P1 - Pending',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(consultantName: 'Tia Safitri'),
    location: ProjectLocation(address: 'Cirebon'),
  ),
  Project(
    projectId: 'P2',
    name: 'Konsultasi P2 - Pending',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(consultantName: 'Johan Prasetyo'),
    location: ProjectLocation(address: 'Solo'),
  ),
  Project(
    projectId: 'P3',
    name: 'Konsultasi P3 - Pending',
    status: 'PENDING',
    consultationInfo: ConsultationInfo(consultantName: 'Dewi Paramita'),
    location: ProjectLocation(address: 'Sukabumi'),
  ),
  // COMPLETED
  Project(
    projectId: 'C1',
    name: 'Konsultasi C1 - Completed',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(consultantName: 'Rizky Alamsyah'),
    location: ProjectLocation(address: 'Palembang'),
  ),
  Project(
    projectId: 'C2',
    name: 'Konsultasi C2 - Completed',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(consultantName: 'Zahra Kamila'),
    location: ProjectLocation(address: 'Manado'),
  ),
  Project(
    projectId: 'C3',
    name: 'Konsultasi C3 - Completed',
    status: 'COMPLETED',
    consultationInfo: ConsultationInfo(consultantName: 'Farhan Akbar'),
    location: ProjectLocation(address: 'Bandar Lampung'),
  ),
];
