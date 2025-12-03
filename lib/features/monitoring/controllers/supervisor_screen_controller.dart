import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';

import '../../../core/base/base_controller.dart';

enum SupervisorSortOption { name, price, distance }

class ConstructionSupervisor {
  ConstructionSupervisor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.priceJuta,
    required this.distanceKm,
  });

  final String id;
  final String name;
  final String specialization;
  final double priceJuta;
  final double distanceKm;

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';

  String get priceLabel {
    final hasDecimal = priceJuta % 1 != 0;
    final value = hasDecimal
        ? priceJuta.toStringAsFixed(1)
        : priceJuta.toStringAsFixed(0);
    return '+ $value Juta';
  }

  String get distanceLabel {
    if (distanceKm < 2) return '< 2 Km';
    if (distanceKm < 5) return '2 - 5 Km';
    return '5 - 10 Km';
  }
}

class SupervisorController extends BaseController {
  final supervisors = <ConstructionSupervisor>[
    ConstructionSupervisor(
      id: '1',
      name: 'Dafni Romadhani',
      specialization: 'Ahli Konstruksi',
      priceJuta: 2.5,
      distanceKm: 1.0,
    ),
    ConstructionSupervisor(
      id: '2',
      name: 'Budi Santoso',
      specialization: 'Ahli Arsitektur',
      priceJuta: 5,
      distanceKm: 1.5,
    ),
    ConstructionSupervisor(
      id: '3',
      name: 'Aryo Timoteus',
      specialization: 'Ahli Konstruksi',
      priceJuta: 2.5,
      distanceKm: 3,
    ),
    ConstructionSupervisor(
      id: '4',
      name: 'Citra Dewi',
      specialization: 'Ahli Struktur',
      priceJuta: 8,
      distanceKm: 3,
    ),
    ConstructionSupervisor(
      id: '5',
      name: 'Danu Pranata',
      specialization: 'Ahli Sipil Ahli Konstruksi',
      priceJuta: 18,
      distanceKm: 7,
    ),
    ConstructionSupervisor(
      id: '6',
      name: 'Eko Prasetyo',
      specialization: 'Ahli Mekanikal',
      priceJuta: 6,
      distanceKm: 7,
    ),
  ].obs;

  final selectedSupervisorId = RxnString();
  final sortOption = SupervisorSortOption.distance.obs;

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
          return a.priceJuta.compareTo(b.priceJuta);
        case SupervisorSortOption.distance:
          return a.distanceKm.compareTo(b.distanceKm);
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
}

/// Make sure you have this route constant somewhere in your app_routes.dart
/// abstract class AppRoutes {
///   static const pengawasanDetail = '/pengawasan/detail';
///   static const pilihTenagaAhli = '/pengawasan/pilih-tenaga-ahli';
///   static const laporanDetail = '/pengawasan/laporan-detail';
///   static const invoiceDetail = '/pengawasan/invoice-detail'; // placeholder
/// }
