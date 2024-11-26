import 'package:cano/data/repository/home/home_repository.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/network/model/user/cano_user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/home/home_menu.dart';
import '../../data/repository/user/cano_user_repository.dart';

class HomeState {
  final List<Map<String, List<HomeMenu>>> homeMenusList;
  final String userName;

  HomeState({
    required this.homeMenusList,
    required this.userName,
  });

  HomeState copyWith(
      {List<Map<String, List<HomeMenu>>>? homeMenusList, String? userName}) {
    return HomeState(
        homeMenusList: homeMenusList ?? this.homeMenusList,
        userName: userName ?? this.userName);
  }
}

class HomeViewmodel extends StateNotifier<HomeState> {
  HomeViewmodel._internal(super.state);

  static final HomeViewmodel _instance =
      HomeViewmodel._internal(HomeState(userName: "", homeMenusList: []));

  factory HomeViewmodel() {
    return _instance;
  }

  static final homeRepository = HomeRepository();
  static final canoUserRepository = CanoUserRepository();

  void _addMapToList(Map<String, List<HomeMenu>> newMap) {
    state = state.copyWith(homeMenusList: [...state.homeMenusList, newMap]);
  }

  void _setUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  Future<void> getHomeMenusWithType() async {
    final userResponse = await _getUserInfo();
    _setUserName(userResponse.name!);

    if (userResponse.acidity != null)
      _getHomeMenusWithAcidity(userResponse.acidity!);
    if (userResponse.body != null) _getHomeMenusWithBody(userResponse.body!);
    if (userResponse.sweetness != null)
      _getHomeMenusWithSweetness(userResponse.sweetness!);
    if (userResponse.bitterness != null)
      _getHomeMenusWithBitterness(userResponse.bitterness!);
  }

  Future<void> _getHomeMenusWithAcidity(String degree) async {
    final searchResponses = await homeRepository.getHomeMenusWithType(
        AppStrings.acidityEng, degree);

    final List<HomeMenu> homeMenus = searchResponses
        .map((menu) => HomeMenu(
              id: menu.id,
              name: menu.name,
              score: menu.score,
              attribute: AppStrings.acidity,
              degree: menu.acidity,
              imageUrl: menu.imageUrl,
            ))
        .toList();

    final newMap = {
      getFlavorDescriptionWithType(AppStrings.acidity, degree): homeMenus
    };
    _addMapToList(newMap);
  }

  Future<void> _getHomeMenusWithBody(String degree) async {
    final searchResponses =
        await homeRepository.getHomeMenusWithType(AppStrings.bodyEng, degree);
    final List<HomeMenu> homeMenus = searchResponses
        .map((menu) => HomeMenu(
              id: menu.id,
              name: menu.name,
              score: menu.score,
              attribute: AppStrings.body,
              degree: menu.body,
              imageUrl: menu.imageUrl,
            ))
        .toList();

    final newMap = {
      getFlavorDescriptionWithType(AppStrings.body, degree): homeMenus
    };
    _addMapToList(newMap);
  }

  Future<void> _getHomeMenusWithSweetness(String degree) async {
    final searchResponses = await homeRepository.getHomeMenusWithType(
        AppStrings.sweetnessEng, degree);
    final List<HomeMenu> homeMenus = searchResponses
        .map((menu) => HomeMenu(
              id: menu.id,
              name: menu.name,
              score: menu.score,
              attribute: AppStrings.sweetness,
              degree: menu.sweetness,
              imageUrl: menu.imageUrl,
            ))
        .toList();

    final newMap = {
      getFlavorDescriptionWithType(AppStrings.sweetness, degree): homeMenus
    };
    _addMapToList(newMap);
  }

  Future<void> _getHomeMenusWithBitterness(String degree) async {
    final searchResponses = await homeRepository.getHomeMenusWithType(
        AppStrings.bitternessEng, degree);
    final List<HomeMenu> homeMenus = searchResponses
        .map((menu) => HomeMenu(
              id: menu.id,
              name: menu.name,
              score: menu.score,
              attribute: AppStrings.bitterness,
              degree: menu.bitterness,
              imageUrl: menu.imageUrl,
            ))
        .toList();

    final newMap = {
      getFlavorDescriptionWithType(AppStrings.bitterness, degree): homeMenus
    };
    _addMapToList(newMap);
  }

  Future<CanoUserResponse> _getUserInfo() async {
    return await canoUserRepository.getUserInfo();
  }

  // Future<void> _getHomeMenusWithAroma(String aroma) async {
  //   final newMap = {aroma: await homeRepository.getHomeMenusWithAroma(aroma)};
  //   _addMapToList(newMap);
  // }

  // type과 degree를 받아서 올바른 맛 설명을 반환하는 함수
  static String getFlavorDescriptionWithType(String type, String degree) {
    switch (type) {
      case AppStrings.acidity:
        return _getAcidityDescription(degree);
      case AppStrings.body:
        return _getBodyDescription(degree);
      case AppStrings.bitterness:
        return _getBitternessDescription(degree);
      case AppStrings.sweetness:
        return _getSweetnessDescription(degree);
      default:
        return "";
    }
  }

  static String _getAcidityDescription(String degree) {
    switch (degree) {
      case AppStrings.VERY_HIGH:
        return FlavorDescriptions.acidityVeryStrong;
      case AppStrings.HIGH:
        return FlavorDescriptions.acidityStrong;
      case AppStrings.MEDIUM:
        return FlavorDescriptions.acidityModerate;
      case AppStrings.LOW:
        return FlavorDescriptions.acidityWeak;
      case AppStrings.NONE:
        return FlavorDescriptions.acidityNone;
      default:
        return "";
    }
  }

  static String _getBodyDescription(String degree) {
    switch (degree) {
      case AppStrings.VERY_HIGH:
        return FlavorDescriptions.bodyVeryStrong;
      case AppStrings.HIGH:
        return FlavorDescriptions.bodyStrong;
      case AppStrings.MEDIUM:
        return FlavorDescriptions.bodyModerate;
      case AppStrings.LOW:
        return FlavorDescriptions.bodyWeak;
      case AppStrings.NONE:
        return FlavorDescriptions.bodyNone;
      default:
        return "";
    }
  }

  static String _getBitternessDescription(String degree) {
    switch (degree) {
      case AppStrings.VERY_HIGH:
        return FlavorDescriptions.bitternessVeryStrong;
      case AppStrings.HIGH:
        return FlavorDescriptions.bitternessStrong;
      case AppStrings.MEDIUM:
        return FlavorDescriptions.bitternessModerate;
      case AppStrings.LOW:
        return FlavorDescriptions.bitternessWeak;
      case AppStrings.NONE:
        return FlavorDescriptions.bitternessNone;
      default:
        return "";
    }
  }

  static String _getSweetnessDescription(String degree) {
    switch (degree) {
      case AppStrings.VERY_HIGH:
        return FlavorDescriptions.sweetnessVeryStrong;
      case AppStrings.HIGH:
        return FlavorDescriptions.sweetnessStrong;
      case AppStrings.MEDIUM:
        return FlavorDescriptions.sweetnessModerate;
      case AppStrings.LOW:
        return FlavorDescriptions.sweetnessWeak;
      case AppStrings.NONE:
        return FlavorDescriptions.sweetnessNone;
      default:
        return "";
    }
  }
}

final homeProvider =
    StateNotifierProvider.autoDispose<HomeViewmodel, HomeState>(
  (ref) => HomeViewmodel(),
);
