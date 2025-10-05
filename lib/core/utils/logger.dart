import 'package:flutter/foundation.dart';

import '../config/environment.dart';

enum LogLevel { debug, info, warning, error }

class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!Environment.instance.enableLogging &&
        !Environment.instance.isDevelopment) {
      return;
    }

    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '[$timestamp][${level.name.toUpperCase()}] $message';

    if (kDebugMode) {
      // Use standard `print` instead of `debugPrint` to ensure ANSI color
      // codes are correctly interpreted by the terminal.
      switch (level) {
        case LogLevel.debug:
          debugPrint(logMessage);
          break;
        case LogLevel.info:
          debugPrint(logMessage);
          break;
        case LogLevel.warning:
          debugPrint(logMessage);
          break;
        case LogLevel.error:
          debugPrint(logMessage);
          if (error != null) {
            debugPrint('Error: $error');
          }
          if (stackTrace != null) {
            debugPrint('Stack Trace:\n$stackTrace');
          }
          break;
      }
    }
  }

  void d(String message) => log(message, level: LogLevel.debug);

  void i(String message) => log(message, level: LogLevel.info);

  void w(String message) => log(message, level: LogLevel.warning);

  void e(String message, {dynamic error, StackTrace? stackTrace}) =>
      log(message, level: LogLevel.error, error: error, stackTrace: stackTrace);
}
