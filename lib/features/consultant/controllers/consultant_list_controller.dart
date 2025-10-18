import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/data/models/consultant.dart' as dto;
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';

class ConsultantListController extends GetxController {
  ConsultantListController(this._getConsultants);

  final GetConsultantsUseCase _getConsultants;

  final RxList<dto.Consultant> items = <dto.Consultant>[].obs;
  final RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();

  late double _lat;
  late double _long;
  late String _type;

  int _page = 0;
  static const int _pageSize = 10;
  bool _done = false; // no more data from server

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    _lat = (args?['lat'] as num?)?.toDouble() ?? 0.0;
    _long = (args?['long'] as num?)?.toDouble() ?? 0.0;
    _type = (args?['type'] as String?) ?? '';

    scrollController.addListener(_onScroll);
    fetchMore();
  }

  void _onScroll() {
    if (isLoading.value || _done) return;
    final position = scrollController.position;
    if (!position.hasPixels || !position.hasContentDimensions) return;
    if (position.pixels >= position.maxScrollExtent - 300) {
      fetchMore();
    }
  }

  Future<void> refreshList() async {
    items.clear();
    _page = 0;
    _done = false;
    await fetchMore();
  }

  Future<void> fetchMore() async {
    if (isLoading.value || _done) return;
    isLoading.value = true;

    final result = await _getConsultants(
      lat: _lat,
      long: _long,
      page: _page,
      size: _pageSize,
    );
    if (result is Success<ConsultantsResponse, Failure>) {
      final newItems = result.value.consultants;
      if (newItems.isEmpty) {
        _done = true;
      } else {
        items.addAll(newItems);
        _page += 1;
      }
    } else if (result is Error<ConsultantsResponse, Failure>) {
      // Optional: show error to user via snackbar/toast
      _done = true; // stop trying to load more on error for now
    }

    isLoading.value = false;
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
