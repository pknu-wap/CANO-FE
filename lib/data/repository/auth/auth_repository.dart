import 'dart:io';

import 'package:cano/utils/key_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../../network/api/auth/cano_auth_api.dart';
import '../../../viewmodel/auth/cano_token_manager.dart';
import '../user/cano_user_repository.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();

  AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }



  static final authApi = CanoAuthApi(Dio());
  static final tokenManager = CanoTokenManager();
  static final userRepositroy = CanoUserRepository();

  Future<void> loginWithKakao(
      VoidCallback onBoarded, VoidCallback unOnBoarded) async {
    OAuthToken? kakaotoken;

    // 카카오톡 설치 여부 확인
    if (await isKakaoTalkInstalled()) {
      try {
        kakaotoken = await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          kakaotoken = await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        kakaotoken = await UserApi.instance.loginWithKakaoAccount();
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }

    if (kakaotoken != null) {
      print("카카오 로그인 SDK 성공 - kakao Token: $kakaotoken");
      try {
        final loginResponse =
            await authApi.loginWithKakao({"token": kakaotoken.accessToken});
        print("카카오 로그인 API 성공 - access Token: ${loginResponse.accessToken}");
        print("카카오 로그인 API 성공 - refresh Token: ${loginResponse.refreshToken}");
        await tokenManager.saveAccessToken(loginResponse.accessToken);
        await tokenManager.saveRefreshToken(loginResponse.refreshToken);

        final userResponse = await userRepositroy.getUserInfo();

        if (userResponse.onboarded) {
          onBoarded.call();
        } else {
          unOnBoarded.call();
        }
      } catch (e) {
        print("카카오 로그인 실패: $e");
      }
    } else
      print("카카오 로그인 실패");
  }

// 카카오 로그아웃
// Future<void> kakaoLogout() async {
//   try {
//     await UserApi.instance.logout();
//     print('로그아웃 성공, SDK에서 토큰 삭제');
//   } catch (error) {
//     print('로그아웃 실패, SDK에서 토큰 삭제 $error');
//   }
// }

// 카카오 연결 끊기(회원 탈퇴)
  Future<void> unLinkWithKakao() async {
    try {
      await UserApi.instance.unlink();
      print('연결 끊기 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('연결 끊기 실패 $error');
    }
  }

  Future<void> loginWithGoogle(VoidCallback onSuccess) async {
    try {
      String? googleClientId = await KeyManager().getGoogleClinedId();
      late GoogleSignIn googleSignIn;
      if (Platform.isAndroid) {
        googleSignIn = GoogleSignIn(
          clientId: googleClientId,
          scopes: [
            'openid',
          ],
        );
      } else if (Platform.isIOS) {
        googleSignIn = GoogleSignIn();
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final String? accessToken = googleAuth.accessToken;
        final String? idToken = googleAuth.idToken;
        print("구글 로그인 성공");
        print("구글 유저: $googleUser");
        print("구글 Access 토큰: $accessToken");
        print("구글 id 토큰: $idToken");
        onSuccess.call();
      }
    } catch (error) {
      print("구글 로그인 실패: $error");
    }
  }

// 카카오의 연결 끊기와 유사
  Future<void> logoutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
    } catch (error) {
      print("구글 로그아웃 실패: $error");
    }
  }

// Future<void> refreshKakaoToken(VoidCallback onSuccess, OAuthToken token) async {
//   try {
//     if (token.refreshTokenExpiresAt != null) {
//       if (DateTime.now().isBefore(token.refreshTokenExpiresAt!)) {
//         // **retrofit 으로 migration 필요함 **//
//         final url = Uri.parse('https://kauth.kakao.com/oauth/token');
//
//         // 요청에 필요한 헤더
//         final headers = {
//           'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
//         };
//
//         await dotenv.load(fileName: 'assets/config/.env');
//         String? kakaoApiKey = dotenv.env['KAKAO_API_KEY'];
//
//         // 요청에 필요한 본문
//         final body = {
//           'grant_type': 'refresh_token',
//           'client_id': '${kakaoApiKey}',
//           'refresh_token': token.refreshToken,
//         };
//
//         final response = await http.post(
//           url,
//           headers: headers,
//           body: body,
//         );
//
//         if (response.statusCode == 200) {
//           // refresh Token은 1개월 전에만 Access token이 재발급될 시에 재발급된다.
//
//           final Map<String, dynamic> responseData = jsonDecode(response.body);
//           AccessTokenResponse tokenResponse =
//               AccessTokenResponse.fromJson(responseData);
//           OAuthToken newToken =
//               OAuthToken.fromResponse(tokenResponse, oldToken: token);
//           TokenManagerProvider.instance.manager.setToken(newToken);
//           print("토큰 재발급 성공 - $newToken");
//           onSuccess.call();
//         } else {
//           print('Failed to refresh token. Status code: ${response.statusCode}');
//           print('Response body: ${response.body}');
//           kakaoLogout();
//         }
//       } else {
//         kakaoLogout();
//       }
//     } else {
//       kakaoLogout();
//     }
//   } catch (error) {
//     kakaoLogout();
//     print("토큰 재발급 실패: $error");
//   }
// }
}
