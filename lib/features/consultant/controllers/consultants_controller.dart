import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';

class ConsultantsController extends BaseController {
  final GetConsultantsUseCase _getConsultantsUseCase;
  final String projectId;
  final double _lat;
  final double _long;
  final RxString selectedSort = ''.obs;

  ConsultantsController(
    this._getConsultantsUseCase,
    this.projectId,
    this._lat,
    this._long,
    String? initialSort,
  );

  // Reactive state
  final consultants = <Consultant>[].obs;
  final isLoading = false.obs; // any fetch in progress
  final hasMore = true.obs; // mirrors _done inverse

  // Scroll
  final scrollController = ScrollController();
  static const double _prefetchExtentPx = 600; // load when < this remains below

  // Paging
  static const int _pageSize = 10;
  int _page = 0; // make sure backend expects 0-based; change to 1 if needed
  bool _done = false; // true when we fetched the last page
  bool _scheduled =
      false; // micro-debounce to avoid duplicate calls in a single frame

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    fetchConsultants();
  }

  void _onScroll() {
    if (_scheduled || isLoading.value || _done) return;
    if (!scrollController.hasClients) return;

    final pos = scrollController.position;
    // extentAfter: content distance below the viewport in px
    if (pos.extentAfter < _prefetchExtentPx) {
      _scheduled = true;
      // Debounce to coalesce multiple notifications per frame
      Future.microtask(() {
        _scheduled = false;
        if (!isLoading.value && !_done) {
          fetchConsultants();
        }
      });
    }
  }

  Future<void> refreshList() async {
    // Optional: keep position, or scrollController.jumpTo(0);
    consultants.clear();
    _page = 0;
    _done = false;
    hasMore.value = true;
    await fetchConsultants();
  }

  Future<void> fetchConsultants() async {
    if (isLoading.value || _done) return;

    isLoading.value = true;
    await handleAsync<ConsultantsResponse>(
      () => _getConsultantsUseCase(
        lat: _lat,
        long: _long,
        page: _page,
        size: _pageSize,
        sortBy: selectedSort.value.isNotEmpty ? selectedSort.value : null,
      ),
      onSuccess: (response) {
        final result = response.consultants;

        if (result.isEmpty) {
          _done = true;
        } else {
          consultants.addAll(result);
          _page += 1;
          // If server returns less than page size, we've reached the last page
          if (result.length < _pageSize) {
            _done = true;
          }
        }

        hasMore.value = !_done;
      },
      onFailure: (failure) {
        // Keep _done as-is so user can retry (via scroll or pull-to-refresh)
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  void goToPortfolio(String consultantId, double price) {
    navigateTo(
      AppRoutes.consultantPortfolio,
      arguments: {
        'consultantId': consultantId,
        'projectId': projectId,
        'isPaidConsultation': price > 0.0,
      },
    );
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void updateSort(String sortKey) {
    if (selectedSort.value == sortKey) return;
    selectedSort.value = sortKey;
    refreshList();
  }
}
