import 'dart:convert';
import 'dart:ui';

import 'package:cano/network/kakao/kakao.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// 카카오 자동 로그인
Future<void> checkAndLogin(VoidCallback onSuccess) async {
  OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();

  if (token != null) {
    // 토큰이 유효할 경우, 자동 로그인 처리
    if (DateTime.now().isBefore(token.expiresAt)) {
      print('자동 로그인 성공: ${token}');
      onSuccess.call();
    } else {
      try {
        refreshKakaoToken(onSuccess, token);
        print("새로운 토큰 발급 성공");
      } catch (error) {
        kakaoLogout();
        print('새로운 access 토큰 재발급 실패: $error');
      }
    }
  } else {}
}

Future<void> refreshKakaoToken(VoidCallback onSuccess, OAuthToken token) async {
  try {
    if (token.refreshTokenExpiresAt != null) {
      if (DateTime.now().isBefore(token.refreshTokenExpiresAt!)) {
        // **retrofit 으로 migration 필요함 **//
        final url = Uri.parse('https://kauth.kakao.com/oauth/token');

        // 요청에 필요한 헤더
        final headers = {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
        };

        // 요청에 필요한 본문
        final body = {
          'grant_type': 'refresh_token',
          'client_id': '324601fb3da8d822f776d20a605b63a6',
          'refresh_token': token.refreshToken,
        };

        final response = await http.post(
          url,
          headers: headers,
          body: body,
        );

        if (response.statusCode == 200) {
          // refresh Token은 1개월 전에만 Access token이 재발급될 시에 재발급된다.

          final Map<String, dynamic> responseData = jsonDecode(response.body);
          AccessTokenResponse tokenResponse =
              AccessTokenResponse.fromJson(responseData);
          OAuthToken newToken =
              OAuthToken.fromResponse(tokenResponse, oldToken: token);
          TokenManagerProvider.instance.manager.setToken(newToken);
          print("토큰 재발급 성공 - $newToken");
          onSuccess.call();
        } else {
          print('Failed to refresh token. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
          kakaoLogout();
        }
      } else {
        kakaoLogout();
      }
    } else {
      kakaoLogout();
    }
  } catch (error) {
    kakaoLogout();
    print("토큰 재발급 실패: $error");
  }
}
