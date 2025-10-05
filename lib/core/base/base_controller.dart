import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/network_manager.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/utils/logger.dart';

abstract class BaseController extends GetxController {
  final _logger = Logger();

  NetworkManager get _networkManager => Get.find<NetworkManager>();

  bool get isConnected => _networkManager.isConnected.value;

  @protected
  Future<void> handleAsync<T>(
    Future<Result<T, Failure>> Function() operation, {
    required void Function(T data) onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    if (!isConnected) {
      const failure = NetworkFailure(AppStrings.noInternetConnection);
      onFailure?.call(failure);
      return;
    }

    try {
      final result = await operation();

      switch (result) {
        case Success(value: final data):
          onSuccess(data);

        case Error(error: final failure):
          onFailure?.call(failure);
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Unhandled error in ViewModel',
        error: e,
        stackTrace: stackTrace,
      );
      final failure = ServerFailure(
        message: 'An unexpected error occurred: $e',
      );
      onFailure?.call(failure);
    }
  }

  /// Displays a standardized error snackbar for a given [Failure].
  /// This can be called manually from controllers when custom error logic is needed.
  void showError(Failure failure) {
    // We always want to show the message when this is called manually.
    _handleError(failure, showErrorMessage: true);
  }

  void _handleError(Failure failure, {bool showErrorMessage = true}) {
    if (showErrorMessage) {
      Get.snackbar(
        AppStrings.errorTitle,
        failure.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
    }
  }

  // --- Navigation ---

  /// Navigates to the specified named route.
  void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  /// Navigates back to the previous screen.
  /// You can optionally provide a [result] to the previous screen.
  void goBack<T>({T? result}) {
    Get.back(result: result);
  }

  /// Navigates to a new screen and removes all previous screens from the stack.
  /// Useful for post-login or logout flows.
  void navigateOffAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  /// Navigates to a new screen and removes the current screen from the stack.
  void navigateOff(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  /// Navigates to a new screen and removes all pages in the stack
  /// until the [untilRoute] is reached.
  ///
  /// This is useful for multi-step flows where you want to return
  /// to a specific screen after completion, clearing the intermediate steps.
  /// Example: navigateAndClearUntil('/profile/edit', untilRoute: AppRoutes.main);
  void navigateAndClearUntil(
    String route, {
    required String untilRoute,
    dynamic arguments,
  }) {
    Get.offNamedUntil(
      route,
      (route) => route.settings.name == untilRoute,
      arguments: arguments,
    );
  }
}
