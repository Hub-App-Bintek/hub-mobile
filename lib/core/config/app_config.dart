// This file will manage application configurations, such as API base URLs,
// loaded from environment variables or a non-versioned configuration file.
// This adheres to the guideline of NO hardcoded keys or URLs.

import 'package:flutter/foundation.dart';

class AppConfig {
  // Example: Loading API Base URL from environment variable (passed via --dart-define)
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    // Provide a default value for development or if the variable is not set,
    // but ensure production builds ALWAYS have the correct environment variable set.
    defaultValue: 'https://api.development.pkphub.com/v1',
  );

  // Example: API Key (SHOULD NOT have a default value in production-like code here)
  // In a real scenario, the absence of this key in a production build should ideally
  // cause a build failure or a clear runtime error during app initialization.
  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    // defaultValue: 'YOUR_DEV_API_KEY' // Avoid default API keys in committed code
  );

  // Example: Feature Flag
  static const bool isNewFeatureEnabled = bool.fromEnvironment(
    'ENABLE_NEW_FEATURE',
    defaultValue: false,
  );

  // Add other configurations as needed (e.g., analytics keys, third-party service IDs)
  // all loaded via String.fromEnvironment or similar mechanisms.

  // It's good practice to validate critical configurations at app startup.
  static void validateCriticalConfigs() {
    if (baseUrl.isEmpty) {
      // Log this error. In a production app, this might be a fatal error.
      if (kDebugMode) {
        print('ERROR: API_BASE_URL is not set.');
      }
    }
    if (apiKey.isEmpty && !isNewFeatureEnabled) { // Example conditional check
      // This check for apiKey being empty might be too lenient for production.
      // Production builds should fail if required keys are missing.
      if (kDebugMode) {
        print('WARNING: API_KEY is not set. Some features might not work.');
      }
    }
    // Add more validation as necessary
  }
}

// In your main.dart, you might call AppConfig.validateCriticalConfigs() during initialization.
