import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/data/repository/menu/menu_repository.dart';
import 'package:cano/data/repository/user/cano_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuState {
  final MenuInfo menuInfo;
  final String userName;

  MenuState({required this.menuInfo, required this.userName});

  MenuState copyWith({MenuInfo? menuInfo, String? userName}) {
    return MenuState(
      menuInfo: menuInfo ?? this.menuInfo,
      userName: userName ?? this.userName,
    );
  }
}

class MenuViewModel extends StateNotifier<MenuState> {
  MenuViewModel._internal(super.state);

  static final MenuViewModel _instance = MenuViewModel._internal(MenuState(
      menuInfo: MenuInfo(
        id: 0,
        name: "Unknown",
        price: 0,
        score: null,
        scoreCount: 0,
        isLike: false,
        imageUrl: "",
        ratingCountsByStar: {5: 0, 4: 0, 3: 0, 2: 0, 1: 0},
        acidity: 0.0,
        body: 0.0,
        bitterness: 0.0,
        sweetness: 0.0,
        aromas: [""],
        aromaCounts: {"": 0},
      ),
      userName: ""));

  factory MenuViewModel() {
    return _instance;
  }

  static final MenuRepository menuRepository = MenuRepository();
  static final CanoUserRepository userRepository = CanoUserRepository();

  Future<void> fetchMenu(int id) async {
    final menuInfo = await menuRepository.getMenu(id);
    state = state.copyWith(menuInfo: menuInfo);
  }

  // Future<void> setUserId() async {
  //   final userResponse = await userRepository.getUserInfo();
  //   state = state.copyWith(userId: userResponse.socialId);
  // }
  //
  Future<void> setUserName() async {
    final userResponse = await userRepository.getUserInfo();
    state = state.copyWith(userName: userResponse.name!);
  }
}

final menuProvider = StateNotifierProvider<MenuViewModel, MenuState>(
  (ref) => MenuViewModel(),
);
