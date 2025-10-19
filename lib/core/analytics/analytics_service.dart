import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import '../config/environment.dart';
import '../utils/logger.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;

  late final FirebaseAnalytics _analytics;
  final _logger = Logger();

  AnalyticsService._internal() {
    _analytics = FirebaseAnalytics.instance;
  }

  Future<void> init() async {
    if (Environment.instance.isProduction) {
      // Only enable analytics in production
      await _analytics.setAnalyticsCollectionEnabled(true);

      // Pass all uncaught errors to Crashlytics
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

      // Pass errors from Dart zone to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }
  }

  Future<void> logScreen(String screenName) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
      _logger.d('Screen viewed: $screenName');
    } catch (e) {
      _logger.e('Failed to log screen view: $e');
    }
  }

  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
      _logger.d('Event logged: $name with parameters: $parameters');
    } catch (e) {
      _logger.e('Failed to log event: $e');
    }
  }

  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      _logger.d('User property set: $name = $value');
    } catch (e) {
      _logger.e('Failed to set user property: $e');
    }
  }

  Future<void> setUserId(String? userId) async {
    try {
      await _analytics.setUserId(id: userId);
      _logger.d('User ID set: $userId');
    } catch (e) {
      _logger.e('Failed to set user ID: $e');
    }
  }
}
