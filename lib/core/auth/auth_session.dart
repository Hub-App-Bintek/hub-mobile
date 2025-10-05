import 'package:pkp_hub/core/storage/secure_storage.dart';

/// Manages auth token persistence and provides a fast in-memory cache.
class AuthSession {
  final SecureStorage _storage;

  AuthSession(this._storage);

  static const _tokenKey = 'jwt_token';

  /// In-memory cache of the token for fast, synchronous access.
  String? _cachedToken;

  /// Public getter for the cached token.
  String? get token => _cachedToken;

  /// Loads token from storage into the in-memory cache.
  /// Should be called once at app startup.
  Future<void> initialize() async {
    _cachedToken = await _storage.read(_tokenKey);
  }

  /// Saves the new token to both secure storage and the in-memory cache.
  Future<void> saveToken(String token) async {
    _cachedToken = token;
    await _storage.write(_tokenKey, token);
  }

  /// Clears the token from both secure storage and the in-memory cache.
  Future<void> clear() async {
    _cachedToken = null;
    await _storage.delete(_tokenKey);
  }
}
