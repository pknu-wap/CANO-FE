import 'package:cano/desginsystem/colors.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/view/widget/home/home_menu_layout.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:cano/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../desginsystem/strings.dart';

late String _userName;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).getHomeMenusWithType();
  }

  @override
  Widget build(BuildContext context) {
    final homeMenusList = ref.watch(homeProvider).homeMenusList;
    _userName = ref.watch(homeProvider).userName;

    ref.listen(homeProvider, (prev, next) {
      print("현재 상태: ${next.homeMenusList}");
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SearchBarDelegate(),
            pinned: true,
            floating: false,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final sectionTitle = homeMenusList[index].keys.first;
                  final homeMenus = homeMenusList[index][sectionTitle];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_userName}${AppStrings.forNickName}",
                          style: TextStyle(fontSize: 14, color: Colors.black26),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              sectionTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(width: 10),
                            Text(AppStrings.coffee,
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: mediaHeight(context, 0.3),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeMenus!.length,
                            itemBuilder: (context, itemIndex) {
                              final homeMenu = homeMenus[itemIndex];
                              return Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: HomeMenuLayout(
                                    onClick: () {}, menu: homeMenu),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: homeMenusList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 검색창을 고정하기 위한 SliverPersistentHeaderDelegate
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 150;
  @override
  double get minExtent => 150;
  final appBarSearchController = TextEditingController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.mainTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            AppBarSearchField(
                hintText: "${_userName}${AppStrings.todayCoffeSearchSCript}",
                height: 40,
                onSearch: (String) {},
                controller: appBarSearchController),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
