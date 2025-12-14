import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/domain/usecases/monitoring/create_monitoring_request_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_supervisor_usecase.dart';

import '../../../core/base/base_controller.dart';

enum SupervisorSortOption { name, price, distance }

class SupervisorController extends BaseController {
  final CreateMonitoringRequestUseCase _createMonitoringRequestUseCase;
  final GetProfessionalsUseCase _getProfessionalsUseCase;

  SupervisorController(
      this._createMonitoringRequestUseCase,
  this._getProfessionalsUseCase,
  );

  final selectedId = Rxn<int>();

  final supervisors = <ConstructionSupervisor>[
    ConstructionSupervisor(
      id: '1',
      name: 'Dafni Romadhani',
      specialization: 'Ahli Konstruksi',
      price: 2.5,
      distance: 1.0,
    ),
    ConstructionSupervisor(
      id: '2',
      name: 'Budi Santoso',
      specialization: 'Ahli Arsitektur',
      price: 5,
      distance: 1.5,
    ),
    ConstructionSupervisor(
      id: '3',
      name: 'Aryo Timoteus',
      specialization: 'Ahli Konstruksi',
      price: 2.5,
      distance: 3,
    ),
    ConstructionSupervisor(
      id: '4',
      name: 'Citra Dewi',
      specialization: 'Ahli Struktur',
      price: 8,
      distance: 3,
    ),
    ConstructionSupervisor(
      id: '5',
      name: 'Danu Pranata',
      specialization: 'Ahli Sipil Ahli Konstruksi',
      price: 18,
      distance: 7,
    ),
    ConstructionSupervisor(
      id: '6',
      name: 'Eko Prasetyo',
      specialization: 'Ahli Mekanikal',
      price: 6,
      distance: 7,
    ),
  ].obs;

  final selectedSupervisorId = RxnString();
  final sortOption = SupervisorSortOption.distance.obs;

  Future<void> fetchSupervisors({String? query}) async {
    // Use handleAsync from your BaseController
    await handleAsync(
          () => _getProfessionalsUseCase(GetProfessionalsParams(query: query)),
      onSuccess: (result) {
        supervisors.assignAll(result.map((e) => e.toEntity()).toList());
        // TODO: Apply sorting logic if needed
      },
    );
  }

  void selectSupervisor(ConstructionSupervisor supervisor) {
    selectedSupervisorId.value = supervisor.id;
  }

  void changeSort(SupervisorSortOption option) {
    sortOption.value = option;
    _sortSupervisors();
  }

  void _sortSupervisors() {
    supervisors.sort((a, b) {
      switch (sortOption.value) {
        case SupervisorSortOption.name:
          return a.name.compareTo(b.name);
        case SupervisorSortOption.price:
          return a.price.compareTo(b.price);
        case SupervisorSortOption.distance:
          return a.distance.compareTo(b.distance);
      }
    });
    supervisors.refresh();
  }

  ConstructionSupervisor? get selectedSupervisor {
    final id = selectedSupervisorId.value;
    if (id == null) return null;
    return supervisors.firstWhereOrNull((s) => s.id == id);
  }

  void goToPengawasanDetail() {
    final supervisor = selectedSupervisor;
    if (supervisor == null) return;

    Get.toNamed(AppRoutes.monitoringDetail, arguments: supervisor);
  }

  Future<void> submitMonitoringRequest() async {
    final supervisorId = selectedId.value;
    if (supervisorId == null) {
      // This should not happen if the button is disabled, but it's good practice.
      Get.snackbar('Error', 'Silakan pilih seorang supervisor terlebih dahulu.');
      return;
    }

    // TODO: Get the actual projectId. It might be passed via Get.arguments
    // For now, I'll use a placeholder.
    const int currentProjectId = 555;

    // Use handleAsync from your BaseController for loading and error states
    await handleAsync(
          () => _createMonitoringRequestUseCase(
        CreateMonitoringRequestParams(
          supervisorId: supervisorId,
          projectId: currentProjectId,
        ),
      ),
      onSuccess: (result) {
        Get.snackbar(
          'Sukses',
          'Permintaan pengawasan berhasil dibuat.',
        );
        // TODO: Navigate to the next screen upon success
        Get.offNamed(AppRoutes.monitoringDetail, arguments: {"projectId":currentProjectId});
      },
      // onFailure is handled automatically by BaseController's handleAsync
    );
  }
}

/// Make sure you have this route constant somewhere in your app_routes.dart
/// abstract class AppRoutes {
///   static const pengawasanDetail = '/pengawasan/detail';
///   static const pilihTenagaAhli = '/pengawasan/pilih-tenaga-ahli';
///   static const laporanDetail = '/pengawasan/laporan-detail';
///   static const invoiceDetail = '/pengawasan/invoice-detail'; // placeholder
/// }
