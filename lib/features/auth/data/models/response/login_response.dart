import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  const LoginResponse({
    this.userId,
    this.fullName,
    this.email,
    this.token,
    this.expiresIn,
    this.status,
  });

  final int? userId;
  final String? fullName;
  final String? email;
  final String? token;
  final int? expiresIn;
  final String? status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json['userId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      status: json['status'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        fullName,
        email,
        token,
        expiresIn,
        status,
      ];
}
