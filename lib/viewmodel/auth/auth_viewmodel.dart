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
    // authRepository.kakaoUnLink();
  }

  Future<void> kakaoUnlink() async {
    authRepository.kakaoUnLink();
  }
}

final authProvider = StateNotifierProvider.autoDispose<AuthViewModel, void>(
  (ref) => AuthViewModel(),
);
