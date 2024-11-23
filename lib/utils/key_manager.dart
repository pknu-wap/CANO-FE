import 'package:flutter_dotenv/flutter_dotenv.dart';

class KeyManager {
  KeyManager._internal();

  static final KeyManager _instance = KeyManager._internal();

  factory KeyManager() {
    return _instance;
  }

  Future<String?> getKakaoNativeAppKey() async {
    await dotenv.load(fileName: 'assets/config/.env');
    return dotenv.env['KAKAO_NATIVE_APP_KEY'].toString();
  }

  Future<String?> getKaKaoAPIKey() async {
    await dotenv.load(fileName: 'assets/config/.env');
    return dotenv.env['KAKAO_API_KEY'].toString();
  }

  Future<String?> getGoogleClinedId() async {
    await dotenv.load(fileName: 'assets/config/.env');
    return dotenv.env['GOOGLE_CLIENT_ID'].toString();
  }

  Future<String> getAccessTokenKey() async {
    await dotenv.load(fileName: 'assets/config/.env');
    return dotenv.env['ACCESS_TOKEN_KEY'].toString();
  }

  Future<String> getRefreshTokenKey() async {
    await dotenv.load(fileName: 'assets/config/.env');
    return dotenv.env['REFRESH_TOKEN_KEY'].toString();
  }
}
