import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/data/repository/menu_repository.dart';

class MenuViewModel extends StateNotifier<MenuInfo> {
  MenuViewModel._internal(super.state);

  static final MenuViewModel _instance = MenuViewModel._internal(
    const MenuInfo(
      cafeName: "스타벅스",
      menuName: "스타벅스 돌체 라떼",
      price: 5900,
      rating: 4.88,
      ratingCount: 201,
      isLike: false,
      menuImageUrl: "",
      ratingCountsByStar: {
        5: 180,
        4: 11,
        3: 10,
        2: 0,
        1: 0,
      },
      acidity: 0.38,
      body: 0.72,
      bitterness: 0,
      sweetness: 0.88,
      aromas: [
        '우디향',
        '마일드',
        '견과류향',
        '곡물향',
        '구운 곡물향',
        '아몬드향',
        '코코아향',
        '스파이시향',
        '캐러멜향'
      ],
      aromaCounts: {
        "우디향": 0,
        "마일드": 0,
        "견과류향": 0,
        "곡물향": 0,
        "구운 곡물향": 0,
        "아몬드향": 17,
        "코코아향": 8,
        "스파이시향": 0,
        "캐러멜향": 0,
      },
    ),
  );

  factory MenuViewModel() {
    return _instance;
  }

  final MenuRepository menuRepository = MenuRepository();

  Future<void> getMenuName() async {
    menuRepository.getMenuName();
  }

  Future<void> getReview() async {
    menuRepository.getReview();
  }

  Future<void> getLikes() async {
    menuRepository.getLikes();
  }

  Future<void> getRatings() async {
    menuRepository.getRatings();
  }

  Future<void> getFlavorAttribute() async {
    menuRepository.getFlavorAttribute();
  }
}


final menuProvider = StateNotifierProvider.autoDispose<MenuViewModel, MenuInfo>(
  (ref) => MenuViewModel(),
);
