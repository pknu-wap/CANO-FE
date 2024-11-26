import 'package:cano/network/model/user/cano_user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/user/cano_user_repository.dart';

class MyPageViewmodel extends StateNotifier<CanoUserResponse> {
  MyPageViewmodel._internal(super.state);

  static final MyPageViewmodel _instance = MyPageViewmodel._internal(
      const CanoUserResponse(
          code: '',
          message: '',
          name: '',
          email: '',
          socialId: 0,
          profileImageUrl: null,
          acidity: '',
          body: null,
          bitterness: null,
          sweetness: null,
          onboarded: true,
          error: null));

  factory MyPageViewmodel() {
    return _instance;
  }

  static final CanoUserRepository userRepository = CanoUserRepository();

  Future<void> setUserInfo(CanoUserResponse userResponse) async {
    state = userResponse;
  }

  Future<void> getUserInfo() async {
    final userResponse = await userRepository.getUserInfo();
    setUserInfo(userResponse);
  }
}

final myPageProvider = StateNotifierProvider<MyPageViewmodel, CanoUserResponse>(
  (ref) => MyPageViewmodel(),
);
