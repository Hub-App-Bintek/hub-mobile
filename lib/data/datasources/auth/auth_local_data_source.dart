import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/entity/user.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(LoginResponse response);
  Future<User?> getUser();
  Future<void> deleteUser();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final UserStorage _userStorage;

  AuthLocalDataSourceImpl(this._userStorage);

  @override
  Future<void> saveUser(LoginResponse response) async {
    final user = User(
      userId: response.userId,
      fullName: response.fullName,
      email: response.email,
      token: response.token,
      role: response.role,
      status: response.status,
      expiresIn: response.expiresIn,
    );
    await _userStorage.saveUser(user);
  }

  @override
  Future<User?> getUser() async {
    return await _userStorage.getUser();
  }

  @override
  Future<void> deleteUser() async {
    await _userStorage.clear();
  }
}
