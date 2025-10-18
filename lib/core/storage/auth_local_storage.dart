import 'package:pkp_hub/core/storage/secure_storage.dart';

class AuthStorage {
  final SecureStorage _storage;

  AuthStorage(this._storage);

  static const _tokenKey = 'jwt_token';

  Future<void> saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  Future<String> getToken() async {
    String token = await _storage.read(_tokenKey) ?? '';
    return token;
  }

  Future<void> clear() async {
    await _storage.delete(_tokenKey);
  }
}
