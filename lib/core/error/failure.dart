import 'package:pkp_hub/core/network/api_error_response.dart';

/// A base class for all failure types in the application.
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Represents a failure originating from the API (e.g., validation error).
/// This directly corresponds to the JSON error object from the backend.
class ApiFailure extends Failure {
  final ApiErrorResponse error;

  /// Creates an ApiFailure, taking the full structured error response.
  /// The general failure message is automatically sourced from the response.
  ApiFailure(this.error) : super(error.message ?? 'Unknown error');
}

/// Represents a device-level network failure (e.g., no internet, timeout).
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Represents a generic server failure where the error format is not the expected JSON
/// (e.g., 500 Internal Server Error with an HTML page).
class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({required String message, this.statusCode})
    : super(message);
}
