import 'dart:ui';

import 'package:cano/data/repository/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<void> {
  AuthViewModel._internal(super.state);

  static final AuthViewModel _instance = AuthViewModel._internal(null);

  factory AuthViewModel() {
    return _instance;
  }

  static final authRepository = AuthRepository();

  Future<void> loginWithKakao(VoidCallback onSuccess) async {
    await authRepository.loginWithKakao(onSuccess);
  }

  Future<void> unlinkWithKakao() async {
    await authRepository.unLinkWithKakao();
  }

  Future<void> loginWithGoogle(VoidCallback onSuccess) async {
    await authRepository.loginWithGoogle(onSuccess);
  }

  Future<void> logoutWithGoogle() async {
    await authRepository.logoutWithGoogle();
  }
}

final authProvider = StateNotifierProvider.autoDispose<AuthViewModel, void>(
  (ref) => AuthViewModel(),
);
