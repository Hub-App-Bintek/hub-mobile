import 'package:flutter/foundation.dart';
import '../utils/logger.dart';
import '../storage/secure_storage.dart';

class AppConfig {
  final Logger _logger;
  final SecureStorage _storage;

  bool _initialized = false;
  final Map<String, dynamic> _config = {};
  final Map<String, bool> _featureFlags = {};

  AppConfig(this._logger, this._storage);

  Future<void> init() async {
    if (_initialized) return;

    try {
      await _loadConfig();
      await _loadFeatureFlags();
      _initialized = true;
      _logger.i('App configuration initialized');
    } catch (e) {
      _logger.e('Failed to initialize app configuration', error: e);
      rethrow;
    }
  }

  Future<void> _loadConfig() async {
    // Default configuration
    _config.addAll({
      'api_timeout': kDebugMode ? 30000 : 10000,
      'cache_duration': const Duration(hours: 24).inMilliseconds,
      'max_retry_attempts': 3,
      'min_log_level': kDebugMode ? 'debug' : 'info',
    });

    // Load any persisted configuration
    final storedConfig = await _storage.readMap('app_config');
    if (storedConfig != null) {
      _config.addAll(storedConfig);
    }
  }

  Future<void> _loadFeatureFlags() async {
    // Default feature flags
    _featureFlags.addAll({
      'enable_biometric': true,
      'enable_push_notifications': true,
      'enable_analytics': !kDebugMode,
      'enable_crash_reporting': !kDebugMode,
      'enable_offline_mode': true,
    });

    // Load any persisted feature flags
    final storedFlags = await _storage.readMap('feature_flags');
    if (storedFlags != null) {
      storedFlags.forEach((key, value) {
        if (value is bool) {
          _featureFlags[key] = value;
        }
      });
    }
  }

  T getValue<T>(String key, {required T defaultValue}) {
    return _config[key] as T? ?? defaultValue;
  }

  bool isFeatureEnabled(String feature) {
    return _featureFlags[feature] ?? false;
  }

  Future<void> setFeatureFlag(String feature, bool enabled) async {
    _featureFlags[feature] = enabled;
    await _storage.writeMap('feature_flags', _featureFlags);
    _logger.i('Feature flag updated: $feature = $enabled');
  }

  Future<void> setValue(String key, dynamic value) async {
    _config[key] = value;
    await _storage.writeMap('app_config', _config);
    _logger.i('Configuration updated: $key = $value');
  }
}
