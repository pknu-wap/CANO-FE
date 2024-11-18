import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends StateNotifier<void> {
  HomeViewmodel._internal(super.state);

  static final HomeViewmodel _instance = HomeViewmodel._internal(null);

  factory HomeViewmodel() {
    return _instance;
  }
}

final homeProvider = StateNotifierProvider.autoDispose<HomeViewmodel, void>(
  (ref) => HomeViewmodel(),
);
