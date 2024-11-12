import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cano/data/model/menu/menu_info.dart';

class MenuViewModel extends StateNotifier<MenuInfo> {
  MenuViewModel._internal(super.state);

  static final MenuViewModel _instance = MenuViewModel._internal(
    const MenuInfo(
      cafeName: "스타벅스",
      menuName: "스타벅스 돌체 라떼",
      menuInfoText: "",
      price: 5900,
      rating: 4.88,
      ratingCount: 201,
      isLike: false,
      likeCount: 0,
      menuImageUrl: "",
      ratingCountsByStar: {
        5: 180,
        4: 11,
        3: 10,
        2: 0,
        1: 0,
      },
      flavorCounts: {
        '산미': 0.38,
        '바디감': 0.72,
        '쓴맛': 0.0,
        '달달함': 0.88,
      },
      aroma: [
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

  // Future<void> getMenuName() async {}

  // Future<void> getReview() async {}

  // Future<void> getLikes() async {}

  // Future<void> getRatings() async {}

  // Future<void> getFlavorAttribute() async {}
}

// final menuProvider = StateNotifierProvider.autoDispose<MenuViewModel, MenuInfo>(
//   (ref) => MenuViewModel(),
// );

final menuProvider = StateNotifierProvider<MenuViewModel, MenuInfo>(
  (ref) => MenuViewModel(),
);
