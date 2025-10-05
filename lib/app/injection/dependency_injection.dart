import 'core_service_injection.dart';
import 'datasource_injection.dart';
import 'repository_injection.dart';

class DependencyInjection {
  static Future<void> init({String? flavor}) async {
    // Read flavor from dart-define if not provided
    final resolvedFlavor = flavor ?? const String.fromEnvironment('FLAVOR', defaultValue: 'development');
    await CoreServiceInjection.init(flavor: resolvedFlavor);

    DataSourceInjection.init();
    RepositoryInjection.init();
  }
}
