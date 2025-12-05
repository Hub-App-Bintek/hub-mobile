// lib/features/licensing/controllers/licensing_controller.dart
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';

class MonitoringController extends BaseController {
  final GetProjectsUseCase _getProjectsUseCase;
  MonitoringController(this._getProjectsUseCase);

  // --- STATE ---
  final RxList<Project> consultations = <Project>[].obs;
  final Rx<Project?> selectedConsultationProject = Rx<Project?>(null);
  final RxInt selectedConsultationIndex = (-1).obs;

  // --- LOGIC ---
  // Fetches data and populates the state. Returns true on success.
  Future<bool> fetchConsultations() async {
    // Reset state before fetching
    consultations.clear();
    selectedConsultationIndex.value = -1;
    bool success = false;

    await handleAsync(
      () => _getProjectsUseCase(
        const GetProjectsRequest(
          page: 0,
          size: 10,
          // type: 'PROTOTYPE',
          // status: 'ACTIVE',
        ),
      ),
      onSuccess: (response) {
        if (response.projects.isEmpty) {
          Get.snackbar(
            'Info',
            'Tidak ada proyek konsultasi yang dapat dipilih.',
          );
          success = false;
        } else {
          consultations.assignAll(response.projects);
          success = true;
        }
      },
      onFailure: (failure) {
        // The BaseController's showError is called automatically by handleAsync's default behavior
        success = false;
      },
    );
    return success;
  }

  // Manages the selection state within the bottom sheet
  void selectConsultation(int index) {
    selectedConsultationIndex.value = index;
  }

  // Confirms the selection and updates the main screen's state
  void confirmSelection() {
    if (selectedConsultationIndex.value >= 0) {
      final project = consultations[selectedConsultationIndex.value];
      selectedConsultationProject.value = project;
      Get.offAndToNamed(
        AppRoutes.monitoringSupervisor,
        arguments: {
          'projectId': project.projectId,
          'isPrototype': project.type!.toUpperCase() == "PROTOTYPE"
              ? true
              : false,
        },
      );
    }
  }
}
