import 'package:equatable/equatable.dart';

/// The response body for a successful user registration.
/// Reflects the latest API contract with all fields being nullable.
class RegisterResponse extends Equatable {
  final int? userId;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? username;
  final String? role;
  final String? ktpUrl;
  final String? selfieUrl;
  final String? status;

  const RegisterResponse({
    this.userId,
    this.fullName,
    this.email,
    this.phone,
    this.username,
    this.role,
    this.ktpUrl,
    this.selfieUrl,
    this.status,
  });

  /// Creates an object from a JSON map.
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      userId: json['userId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      ktpUrl: json['ktpUrl'] as String?,
      selfieUrl: json['selfieUrl'] as String?,
      status: json['status'] as String?,
    );
  }

  @override
  List<Object?> get props {
    return [
      userId,
      fullName,
      email,
      phone,
      username,
      role,
      ktpUrl,
      selfieUrl,
      status,
    ];
  }
}
