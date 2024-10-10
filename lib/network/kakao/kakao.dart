import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

Future<void> kakaoLogin(VoidCallback onSuccess) async {
  OAuthToken? token = null;

  // 카카오톡 설치 여부 확인
  if (await isKakaoTalkInstalled()) {
    try {
      token = await UserApi.instance.loginWithKakaoTalk();
      onSuccess.call();
      print("로그인 성공 - kakao Token: $token");
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        onSuccess.call();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      token = await UserApi.instance.loginWithKakaoAccount();
      onSuccess.call();
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }

  if (token != null) {
    TokenManagerProvider.instance.manager.setToken(token);
  }
}

// 로그아웃
Future<void> kakaoLogout() async {
  try {
    await UserApi.instance.logout();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}

// 연결 끊기(회원 탈퇴)
Future<void> kakaoUnlink() async {
  try {
    await UserApi.instance.unlink();
    print('연결 끊기 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('연결 끊기 실패 $error');
  }
}
