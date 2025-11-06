import 'dart:convert';

import 'package:pkp_hub/core/storage/secure_storage.dart';
import 'package:pkp_hub/data/entity/user.dart';

class UserStorage {
  final SecureStorage _storage;

  UserStorage(this._storage);

  static const _userKey = 'user_data';
  static const _balanceKey = 'user_balance';

  Future<void> saveUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    await _storage.write(_userKey, userJson);
  }

  Future<User?> getUser() async {
    String? userJson = await _storage.read(_userKey);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
  }

  Future<String?> getToken() async {
    String? userJson = await _storage.read(_userKey);
    if (userJson == null) return null;
    User user = User.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
    return user.token ?? '';
  }

  /// Persist a numeric balance value as a string in secure storage.
  Future<void> saveBalance(double balance) async {
    await _storage.write(_balanceKey, balance.toString());
  }

  /// Read the saved balance value. Returns null when not present or unparsable.
  Future<double?> getBalance() async {
    final s = await _storage.read(_balanceKey);
    if (s == null) return null;
    return double.tryParse(s);
  }

  /// Remove persisted balance.
  Future<void> clearBalance() async {
    await _storage.delete(_balanceKey);
  }

  Future<void> clear() async {
    await _storage.delete(_userKey);
  }
}
