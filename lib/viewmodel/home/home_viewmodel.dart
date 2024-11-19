import 'package:cano/data/repository/home/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/home/home_menu.dart';

class HomeViewmodel extends StateNotifier<void> {
  HomeViewmodel._internal(super.state);

  static final HomeViewmodel _instance = HomeViewmodel._internal(null);

  factory HomeViewmodel() {
    return _instance;
  }

  static final homeRepository = HomeRepository();

  Future<HomeMenu> getHomeMenusWithType(String type, String degree) async {
    return await homeRepository.getHomeMenusWithType(type, degree);
  }

  Future<HomeMenu> getHomeMenusWithAroma(String aromas) async {
    return await homeRepository.getHomeMenusWithAroma(aromas);
  }
}

final homeProvider = StateNotifierProvider.autoDispose<HomeViewmodel, void>(
  (ref) => HomeViewmodel(),
);
