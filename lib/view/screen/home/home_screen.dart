import 'package:cano/desginsystem/colors.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/view/widget/home/home_menu_layout.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:cano/viewmodel/auth/cano_token_manager.dart';
import 'package:cano/viewmodel/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../desginsystem/strings.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    print("현재 상태 length : ${homeState}");

    ref.listen(homeProvider, (prev, next) {
      print("현재 상태: ${next}");
    });
  

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   floating: true,
          //   toolbarHeight: 30,
          //   backgroundColor: AppColors.primary,
          //   flexibleSpace: FlexibleSpaceBar(
          //       background: Padding(
          //     padding: const EdgeInsets.only(top: 30),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           padding: EdgeInsets.only(left: 30),
          //           child: Text(
          //             AppStrings.mainTitle,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20),
          //           ),
          //         ),
          //       ],
          //     ),
          //   )),
          // ),
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
                  final sectionTitle = homeState[index].keys.first;
                  final homeMenus = homeState[index][sectionTitle];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OOO님을 위한",
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
                childCount: homeState.length,
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
                hintText: AppStrings.todayCoffeSearchText,
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
