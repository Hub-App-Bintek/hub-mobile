import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/injection/network_service_injection.dart';
import 'package:pkp_hub/app/injection/repository_injection.dart';
import 'package:pkp_hub/core/config/app_config.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/network_manager.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/core/storage/secure_storage.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:talker/talker.dart';

import 'datasource_injection.dart';

class AppBinding extends Bindings {
  final String flavor;

  AppBinding({required this.flavor});

  @override
  void dependencies() {
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

    final apiBaseUrl = getString('API_BASE_URL', fallback: '');
    final apiKey = getString('API_KEY', fallback: '');
    final enableLogging = getBool(
      'ENABLE_LOGGING',
      fallback: flavor != 'production',
    );
    final enableAnalytics = getBool(
      'ENABLE_ANALYTICS',
      fallback: flavor != 'development',
    );

    final talker = Talker(
      settings: TalkerSettings(useConsoleLogs: true, enabled: true),
      logger: TalkerLogger(
        settings: const TalkerLoggerSettings(enableColors: true),
      ),
    );

    Environment.initialize(
      apiBaseUrl: apiBaseUrl,
      apiKey: apiKey,
      enableLogging: enableLogging,
      enableAnalytics: enableAnalytics,
      environment: flavor,
    );

    Get.put<Logger>(Logger(), permanent: true);
    Get.put<Talker>(talker, permanent: true);
    Get.put<FlutterSecureStorage>(
      const FlutterSecureStorage(),
      permanent: true,
    );
    Get.put<SecureStorage>(
      SecureStorage(Get.find(), Get.find()),
      permanent: true,
    );
    Get.put<AppConfig>(AppConfig(Get.find(), Get.find()), permanent: true);
    Get.put<AuthStorage>(AuthStorage(Get.find()), permanent: true);
    Get.putAsync<NetworkManager>(() async => NetworkManager(), permanent: true);
    Get.lazyPut<ApiClient>(
      () => ApiClient(authStorage: Get.find(), talker: Get.find()),
      fenix: true,
    );

    NetworkServiceInjection.init();
    DataSourceInjection.init();
    RepositoryInjection.init();
  }
}
