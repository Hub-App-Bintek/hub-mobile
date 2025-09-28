import 'package:flutter/foundation.dart';
// import 'package:pkp_hub/core/error_handling/app_error.dart'; // Assuming you'll have a base error type

// This file defines a sealed class (or equivalent) for wrapping API responses,
// clearly distinguishing between success and error states.

@immutable
sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  // final AppError error; // Use a structured error type
  final String message; // Or a simpler message for now
  final int? statusCode; // Optional: to carry HTTP status code

  const Failure(this.message, {this.statusCode});

  // Example if using a more structured AppError:
  // const Failure(this.error);
}

// Usage example (conceptual, within a repository or use case):
// Future<ApiResult<User>> fetchUser(String userId) async {
//   try {
//     // final response = await apiClient.dio.get('/users/$userId');
//     // if (response.statusCode == 200 && response.data != null) {
//     //   return Success(User.fromJson(response.data));
//     // } else {
//     //   return Failure(
//     //     AppError(
//     //       message: 'Failed to fetch user: ${response.statusMessage}',
//     //       code: response.statusCode,
//     //     )
//     //   );
//     // }
//     // Simplified for placeholder:
//     await Future.delayed(const Duration(seconds: 1)); // Simulate network call
//     if (userId == "1") {
//       return const Success("User Data Example" as T); // Replace with actual User object
//     } else {
//       return Failure('User not found with id: $userId', statusCode: 404);
//     }
//   } catch (e) {
//     // Log the error using a proper logger, ensuring no sensitive data is logged.
//     // return Failure(AppError(message: 'An unexpected error occurred: ${e.toString()}', originalException: e));
//     return Failure('An unexpected error occurred: ${e.toString()}');
//   }
// }
