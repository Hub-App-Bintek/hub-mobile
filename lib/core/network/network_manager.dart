import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../utils/logger.dart';

class NetworkManager extends GetxService {
  final _connectivity = Connectivity();
  final _logger = Logger();
  final RxBool isConnected = true.obs;
  StreamSubscription? _subscription;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _startMonitoring();
  }

  Future<void> _checkInitialConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      isConnected.value = result != ConnectivityResult.none;
    } catch (e) {
      _logger.e('Error checking initial connection', error: e);
      isConnected.value = false;
    }
  }

  void _startMonitoring() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      isConnected.value = result != ConnectivityResult.none;
      _logger.i('Network connectivity changed: ${isConnected.value}');
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
