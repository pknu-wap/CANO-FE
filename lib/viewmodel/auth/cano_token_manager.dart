import 'package:cano/utils/key_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CanoTokenManager extends StateNotifier<void> {
  CanoTokenManager._internal(super.state);

  static final CanoTokenManager _instance = CanoTokenManager._internal(null);

  factory CanoTokenManager() {
    return _instance;
  }

  static final keyManager = KeyManager();
  static const storage = FlutterSecureStorage();

  Future<bool> checkToken() async {
    String? token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> _saveToken(String key, String token) async {
    await storage.write(key: key, value: token);
  }

  Future<String?> _getToken(String key) async {
    return storage.read(key: key);
  }

  Future<void> saveAccessToken(String accessToken) async {
    final accessTokenKey = await keyManager.getAccessTokenKey();
    await _saveToken(accessTokenKey, accessToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    final refreshTokenKey = await keyManager.getRefreshTokenKey();
    await _saveToken(refreshTokenKey, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final accessTokenKey = await keyManager.getAccessTokenKey();
    return await _getToken(accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    final refreshTokenKey = await keyManager.getRefreshTokenKey();
    return _getToken(refreshTokenKey);
  }
}

final authProvider = StateNotifierProvider.autoDispose<CanoTokenManager, void>(
  (ref) => CanoTokenManager(),
);
