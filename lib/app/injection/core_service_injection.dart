import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/network_manager.dart';
import 'package:pkp_hub/core/storage/secure_storage.dart';
import 'package:pkp_hub/core/utils/logger.dart';

class CoreServiceInjection {
  static Future<void> init({required String flavor}) async {
    // Resolve default base URL per flavor
    final defaultBaseUrl = switch (flavor) {
      'development' => 'http://localhost:8080',
      'staging' => 'https://staging.example.com',
      'production' => 'https://api.example.com',
      _ => 'http://localhost:8080',
    };

    // Load .env per flavor
    final envFile = switch (flavor) {
      'development' => '.env.development',
      'staging' => '.env.staging',
      'production' => '.env.production',
      _ => '.env.development',
    };
    await dotenv.load(fileName: envFile);

    // Helpers to read from dart-define first, then .env, then fallback
    String getString(String key, {String? fallback}) {
      const empty = '';
      final fromDefine = String.fromEnvironment(key, defaultValue: empty);
      if (fromDefine.isNotEmpty) return fromDefine;
      final fromEnv = dotenv.env[key] ?? empty;
      if (fromEnv.isNotEmpty) return fromEnv;
      return fallback ?? empty;
    }

    bool getBool(String key, {bool? fallback}) {
      const empty = '';
      final fromDefine = String.fromEnvironment(key, defaultValue: empty);
      if (fromDefine.isNotEmpty) {
        final v = fromDefine.toLowerCase();
        return v == 'true' || v == '1' || v == 'yes';
      }
      final fromEnv = dotenv.env[key] ?? empty;
      if (fromEnv.isNotEmpty) {
        final v = fromEnv.toLowerCase();
        return v == 'true' || v == '1' || v == 'yes';
      }
      return fallback ?? false;
    }

    final apiBaseUrl = getString('API_BASE_URL', fallback: defaultBaseUrl);
    final apiKey = getString('API_KEY', fallback: 'your-api-key');
    final enableLogging = getBool('ENABLE_LOGGING', fallback: flavor != 'production');
    final enableAnalytics = getBool('ENABLE_ANALYTICS', fallback: flavor != 'development');

    Environment.initialize(
      apiBaseUrl: apiBaseUrl,
      apiKey: apiKey,
      enableLogging: enableLogging,
      enableAnalytics: enableAnalytics,
      environment: flavor,
    );

    Get.put(Logger(), permanent: true);
    Get.put(SecureStorage(), permanent: true);

    // --- Corrected Dependency Injection Flow ---

    // 1. Create AuthSession with SecureStorage, initialize it, then register it.
    final session = AuthSession(Get.find<SecureStorage>());
    await session.initialize(); // Load token from previous app session
    Get.put(session, permanent: true);

    // 2. Finally, create and register ApiClient, giving it the session instance.
    Get.put(ApiClient(authSession: Get.find()), permanent: true);

    // -------------------------------------------

    await Get.putAsync<NetworkManager>(() async {
      final networkManager = NetworkManager();
      return networkManager;
    }, permanent: true);
  }
}
