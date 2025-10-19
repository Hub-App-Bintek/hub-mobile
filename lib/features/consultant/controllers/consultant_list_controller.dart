import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';

class ConsultantListController extends BaseController {
  final GetConsultantsUseCase _getConsultantsUseCase;
  final double _lat;
  final double _long;
  final String _type;

  ConsultantListController(
    this._getConsultantsUseCase,
    this._lat,
    this._long,
    this._type,
  );

  final RxList<Consultant> consultants = <Consultant>[].obs;
  final RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();

  int _page = 0;
  static const int _pageSize = 10;
  bool _done = false; // no more data from server

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    fetchConsultants();
  }

  void _onScroll() {
    if (isLoading.value || _done) return;
    final position = scrollController.position;
    if (!position.hasPixels || !position.hasContentDimensions) return;
    if (position.pixels >= position.maxScrollExtent - 300) {
      fetchConsultants();
    }
  }

  Future<void> refreshList() async {
    consultants.clear();
    _page = 0;
    _done = false;
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
      ),
      onSuccess: (response) {
        final result = response.consultants;
        if (result.isEmpty) {
          _done = true;
        } else {
          consultants.addAll(result);
          _page += 1;
        }
      },
      onFailure: (failure) {
        _done = true;
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  void goToPortfolio(String consultantId) {
    navigateTo(
      AppRoutes.consultantPortfolio,
      arguments: {'consultantId': consultantId},
    );
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
