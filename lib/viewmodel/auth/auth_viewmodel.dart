import 'dart:ui';

import 'package:cano/data/repository/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<void> {
  AuthViewModel._internal(super.state);

  static final AuthViewModel _instance = AuthViewModel._internal(null);

  factory AuthViewModel() {
    return _instance;
  }

  final AuthRepository authRepository = AuthRepository();

  Future<void> kakaoLogin(VoidCallback onSuccess) async {
    authRepository.kakaoLogin(onSuccess);
  }

  Future<void> kakaoUnlink() async {
    authRepository.kakaoUnLink();
  }

  Future<void> googleLogin(VoidCallback onSuccess) async {
    authRepository.googleLogin(onSuccess);
  }

  Future<void> googleLogout() async {
    authRepository.googleLogout();
  }
}

final authProvider = StateNotifierProvider.autoDispose<AuthViewModel, void>(
  (ref) => AuthViewModel(),
);
