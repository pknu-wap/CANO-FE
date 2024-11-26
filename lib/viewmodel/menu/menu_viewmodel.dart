import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/data/repository/menu/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuViewModel extends StateNotifier<MenuInfo?> {
  MenuViewModel() : super(null) {
    fetchMenu(1); // 초기 메뉴 ID
  }

  final MenuRepository menuRepository = MenuRepository();

  Future<void> fetchMenu(int id) async {
    try {
      final menuInfo = await menuRepository.getMenu(id);
      if (menuInfo != null) {
        state = menuInfo;
      } else {
        // 에러 처리 또는 기본값 설정
        state = const MenuInfo(
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
        );
      }
    } catch (e) {
      // 에러 처리
      print('Error fetching menu: $e');
      state = null; // 에러 시 null로 설정하거나 기본값 설정
    }
  }

  // 상태 변경 메서드들...
  void setMenuName(String name) {
    if (state != null) {
      state = state!.copyWith(name: name);
    }
  }

  void setPrice(int price) {
    if (state != null) {
      state = state!.copyWith(price: price);
    }
  }

  void setScore(double? score) {
    if (state != null) {
      state = state!.copyWith(score: score);
    }
  }

  void setScoreCount(int scoreCount) {
    if (state != null) {
      state = state!.copyWith(scoreCount: scoreCount);
    }
  }

  void setIsLike(bool isLike) {
    if (state != null) {
      state = state!.copyWith(isLike: isLike);
    }
  }

  void setImageUrl(String imageUrl) {
    if (state != null) {
      state = state!.copyWith(imageUrl: imageUrl);
    }
  }

  void setRatingCountsByStar(Map<int, int> ratingCountsByStar) {
    if (state != null) {
      state = state!.copyWith(ratingCountsByStar: ratingCountsByStar);
    }
  }

  void setAcidity(double? acidity) {
    if (state != null) {
      state = state!.copyWith(acidity: acidity);
    }
  }

  void setBody(double? body) {
    if (state != null) {
      state = state!.copyWith(body: body);
    }
  }

  void setBitterness(double? bitterness) {
    if (state != null) {
      state = state!.copyWith(bitterness: bitterness);
    }
  }

  void setSweetness(double? sweetness) {
    if (state != null) {
      state = state!.copyWith(sweetness: sweetness);
    }
  }

  void setAromas(List<String>? aromas) {
    if (state != null) {
      state = state!.copyWith(aromas: aromas);
    }
  }

  void setAromaCounts(Map<String, int>? aromaCounts) {
    if (state != null) {
      state = state!.copyWith(aromaCounts: aromaCounts);
    }
  }

  void toggleIsLike() {
    if (state != null && state!.isLike != null) {
      state = state!.copyWith(isLike: !state!.isLike!);
      // 추가로 API 호출 등을 통해 서버와 동기화할 수 있습니다.
    }
  }
}

final menuProvider =
    StateNotifierProvider.autoDispose<MenuViewModel, MenuInfo?>(
  (ref) => MenuViewModel(),
);
