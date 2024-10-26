import 'package:cano/utils/key_manager.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager extends StateNotifier<void> {
  TokenManager._internal(super.state);

  static final TokenManager _instance = TokenManager._internal(null);

  factory TokenManager() {
    return _instance;
  }

  static final keyManager = KeyManager();
  static const storage = FlutterSecureStorage();

  Future<bool> checkToken() async {
    String? token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> saveEncryptedToken(String key, String token) async {
    final encryptedToken = encrypt(token);
    await storage.write(key: key, value: encryptedToken);
  }

  Future<String?> getDecryptedToken(String key) async {
    final encryptedToken = await storage.read(key: key);
    return encryptedToken != null ? decrypt(encryptedToken) : null;
  }

  Future<void> saveAccessToken(String accessToken) async {
    final String accessTokenKey = keyManager.getAccessTokenKey().toString();
    await saveEncryptedToken(accessTokenKey, accessToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    final String refreshTokenKey = keyManager.getRefreshTokenKey().toString();
    await saveEncryptedToken(refreshTokenKey, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final String accessTokenKey = keyManager.getAccessTokenKey().toString();
    return await getDecryptedToken(accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    final String refreshTokenKey = keyManager.getRefreshTokenKey().toString();
    return await getDecryptedToken(refreshTokenKey);
  }

  String encrypt(String text) {
    final String tokenAESKey = keyManager.getTokenAESKey().toString();

    final key = Key.fromUtf8(tokenAESKey);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);

    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final String tokenAESKey = keyManager.getTokenAESKey().toString();
    final key = Key.fromUtf8(tokenAESKey); // 32 바이트 AES 키
    final iv = IV.fromLength(16); // 16 바이트 초기화 벡터

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);

    return decrypted;
  }
}

final authProvider = StateNotifierProvider.autoDispose<TokenManager, void>(
  (ref) => TokenManager(),
);
