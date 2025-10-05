class Environment {
  final String apiBaseUrl;
  final String apiKey;
  final bool enableLogging;
  final bool enableAnalytics;
  final String environment;

  const Environment._({
    required this.apiBaseUrl,
    required this.apiKey,
    required this.enableLogging,
    required this.enableAnalytics,
    required this.environment,
  });

  static late Environment _instance;

  static Environment get instance => _instance;

  static void initialize({
    required String apiBaseUrl,
    required String apiKey,
    required bool enableLogging,
    required bool enableAnalytics,
    required String environment,
  }) {
    _instance = Environment._(
      apiBaseUrl: apiBaseUrl,
      apiKey: apiKey,
      enableLogging: enableLogging,
      enableAnalytics: enableAnalytics,
      environment: environment,
    );
  }

  bool get isDevelopment => environment == 'development';
  bool get isStaging => environment == 'staging';
  bool get isProduction => environment == 'production';
}
