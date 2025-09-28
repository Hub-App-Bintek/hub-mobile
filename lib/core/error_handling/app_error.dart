import 'package:flutter/foundation.dart';

// This file defines structured error/exception types for the application,
// promoting consistent error handling as per the senior developer guidelines.

/// Base class for all application-specific errors/exceptions.
/// This allows for catching all custom app errors with a single catch block if needed.
@immutable
abstract class AppError implements Exception {
  final String message;
  final int? code; // Optional: e.g., HTTP status code, or internal error code
  final Object? originalException; // Optional: to store the underlying exception for debugging

  const AppError({
    required this.message,
    this.code,
    this.originalException,
  });

  @override
  String toString() {
    return 'AppError(message: $message, code: $code, originalException: $originalException)';
  }

  // It's crucial to ensure no sensitive data is included in the default toString or logged directly.
  // Provide a user-friendly message for UI display.
  String get userFriendlyMessage => 'An unexpected error occurred. Please try again later.';
}

/// Represents an error originating from a network request.
class NetworkError extends AppError {
  const NetworkError({
    required super.message,
    super.code, // Typically HTTP status code
    super.originalException,
  });

  @override
  String get userFriendlyMessage {
    if (code == 401) return 'Authentication failed. Please log in again.';
    if (code == 403) return 'You do not have permission to perform this action.';
    if (code == 404) return 'The requested resource was not found.';
    if (code != null && code! >= 500) return 'A server error occurred. Please try again later.';
    return 'A network issue occurred. Please check your connection and try again.';
  }
}

/// Represents an error during data parsing (e.g., JSON decoding).
class DataParsingError extends AppError {
  const DataParsingError({
    required super.message,
    super.originalException,
  }) : super(code: null); // No specific code for parsing errors usually

  @override
  String get userFriendlyMessage => 'There was an issue processing data. Please try again.';
}

/// Represents an error from local storage operations.
class LocalStorageError extends AppError {
  const LocalStorageError({
    required super.message,
    super.originalException,
  }) : super(code: null);

  @override
  String get userFriendlyMessage => 'A local storage error occurred. Please try restarting the app.';
}

/// Represents an unexpected error.
class UnexpectedError extends AppError {
  const UnexpectedError({
    required super.message,
    super.originalException,
  }) : super(code: null);
}

// Add more specific AppError types as needed, e.g.:
// class AuthenticationError extends AppError { ... }
// class PermissionError extends AppError { ... }
// class BusinessLogicError extends AppError { ... }
