import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/logger.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;
  final Logger _logger;

  SecureStorage(this._logger, this._storage);

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      _logger.e('Error writing to secure storage', error: e);
      rethrow;
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      _logger.e('Error reading from secure storage', error: e);
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      _logger.e('Error deleting from secure storage', error: e);
      rethrow;
    }
  }

  Future<void> writeMap(String key, Map<String, dynamic> value) async {
    try {
      final jsonStr = jsonEncode(value);
      await write(key, jsonStr);
    } catch (e) {
      _logger.e('Error writing map to secure storage', error: e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> readMap(String key) async {
    try {
      final jsonStr = await read(key);
      if (jsonStr == null) return null;
      return jsonDecode(jsonStr) as Map<String, dynamic>;
    } catch (e) {
      _logger.e('Error reading map from secure storage', error: e);
      rethrow;
    }
  }
}
