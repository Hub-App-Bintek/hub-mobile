import 'package:equatable/equatable.dart';

/// Request model representing login credentials for API calls or repository usage.
class LoginRequest extends Equatable {
  const LoginRequest({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json['email'] as String? ?? '',
        password: json['password'] as String? ?? '',
      );

  @override
  List<Object?> get props => [email, password];
}

