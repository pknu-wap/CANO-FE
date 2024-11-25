import 'package:cano/data/repository/home/home_repository.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/home/home_menu.dart';

class HomeViewmodel extends StateNotifier<List<Map<String, List<HomeMenu>>>> {
  HomeViewmodel._internal(super.state);

  static final HomeViewmodel _instance = HomeViewmodel._internal([
    {
      FlavorDescriptions.acidityStrong: [
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.8,
            attribute: AppStrings.acidity,
            degree: 88,
            image_url: "https://picsum.photos/23"),
        const HomeMenu(
            id: 1,
            name: "투썸플레이스 연유 라떼",
            score: 3.6,
            attribute: AppStrings.acidity,
            degree: 88,
            image_url: "https://picsum.photos/43"),
        const HomeMenu(
            id: 1,
            name: "부경대 파라다이스 아메리카노",
            score: 5.0,
            attribute: AppStrings.acidity,
            degree: 88,
            image_url: "https://picsum.photos/33"),
        const HomeMenu(
            id: 1,
            name: "오빠 다방 아메리카노",
            score: 1.8,
            attribute: AppStrings.acidity,
            degree: 88,
            image_url: "https://picsum.photos/13"),
      ],
    },
    {
      FlavorDescriptions.sweetnessVeryStrong: [
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.4,
            attribute: AppStrings.sweetness,
            degree: 88,
            image_url: "https://picsum.photos/69"),
        const HomeMenu(
            id: 1,
            name: "051 아메리카노",
            score: 4.8,
            attribute: AppStrings.sweetness,
            degree: 88,
            image_url: "https://picsum.photos/32"),
        const HomeMenu(
            id: 1,
            name: "051 카페라떼",
            score: 4.2,
            attribute: AppStrings.sweetness,
            degree: 88,
            image_url: "https://picsum.photos/22"),
        const HomeMenu(
            id: 1,
            name: "노씨커피 옥수수 라떼",
            score: 4.8,
            attribute: AppStrings.sweetness,
            degree: 88,
            image_url: "https://picsum.photos/12"),
      ],
    },
    {
      FlavorDescriptions.bodyModerate: [
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.8,
            attribute: AppStrings.body,
            degree: 88,
            image_url: "https://picsum.photos/23"),
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.8,
            attribute: AppStrings.body,
            degree: 88,
            image_url: "https://picsum.photos/43"),
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.8,
            attribute: AppStrings.body,
            degree: 88,
            image_url: "https://picsum.photos/33"),
        const HomeMenu(
            id: 1,
            name: "스타벅스 돌체 라떼",
            score: 4.8,
            attribute: AppStrings.body,
            degree: 88,
            image_url: "https://picsum.photos/13"),
      ],
    }
  ]);

  factory HomeViewmodel() {
    return _instance;
  }

  static final homeRepository = HomeRepository();

  void _addMapToList(Map<String, List<HomeMenu>> newMap) {
    state = [...state, newMap];
  }

  Future<void> _getHomeMenusWithType(String type, String degree) async {
    final newMap = {
      getFlavorDescriptionWithType(type, degree):
          await homeRepository.getHomeMenusWithType(type, degree)
    };
    _addMapToList(newMap);
  }

  Future<void> _getHomeMenusWithAroma(String aroma) async {
    final newMap = {aroma: await homeRepository.getHomeMenusWithAroma(aroma)};
    _addMapToList(newMap);
  }

  // type과 degree를 받아서 올바른 맛 설명을 반환하는 함수
  static String getFlavorDescriptionWithType(String type, String degree) {
    switch (type) {
      case '산미':
        return _getAcidityDescription(degree);
      case '바디감':
        return _getBodyDescription(degree);
      case '쓴맛':
        return _getBitternessDescription(degree);
      case '단맛':
        return _getSweetnessDescription(degree);
      default:
        return '없음';
    }
  }

  static String _getAcidityDescription(String degree) {
    switch (degree) {
      case '매우 강한':
        return FlavorDescriptions.acidityVeryStrong;
      case '강한':
        return FlavorDescriptions.acidityStrong;
      case '적당한':
        return FlavorDescriptions.acidityModerate;
      case '약한':
        return FlavorDescriptions.acidityWeak;
      case '없는':
        return FlavorDescriptions.acidityNone;
      default:
        return '알 수 없는 산미 정도';
    }
  }

  static String _getBodyDescription(String degree) {
    switch (degree) {
      case '매우 강한':
        return FlavorDescriptions.bodyVeryStrong;
      case '강한':
        return FlavorDescriptions.bodyStrong;
      case '적당한':
        return FlavorDescriptions.bodyModerate;
      case '약한':
        return FlavorDescriptions.bodyWeak;
      case '없는':
        return FlavorDescriptions.bodyNone;
      default:
        return '알 수 없는 바디감 정도';
    }
  }

  static String _getBitternessDescription(String degree) {
    switch (degree) {
      case '매우 강한':
        return FlavorDescriptions.bitternessVeryStrong;
      case '강한':
        return FlavorDescriptions.bitternessStrong;
      case '적당한':
        return FlavorDescriptions.bitternessModerate;
      case '약한':
        return FlavorDescriptions.bitternessWeak;
      case '없는':
        return FlavorDescriptions.bitternessNone;
      default:
        return '알 수 없는 쓴맛 정도';
    }
  }

  static String _getSweetnessDescription(String degree) {
    switch (degree) {
      case '매우 강한':
        return FlavorDescriptions.sweetnessVeryStrong;
      case '강한':
        return FlavorDescriptions.sweetnessStrong;
      case '적당한':
        return FlavorDescriptions.sweetnessModerate;
      case '약한':
        return FlavorDescriptions.sweetnessWeak;
      case '없는':
        return FlavorDescriptions.sweetnessNone;
      default:
        return '알 수 없는 단맛 정도';
    }
  }
}

final homeProvider = StateNotifierProvider.autoDispose<HomeViewmodel,
    List<Map<String, List<HomeMenu>>>>(
  (ref) => HomeViewmodel(),
);
