import 'package:cano/desginsystem/colors.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:flutter/material.dart';

import '../../../desginsystem/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 35,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 30,
              ),
              title: Text(
                AppStrings.mainTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _SearchBarDelegate(),
            pinned: true,
            floating: true,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Text(
                  "바닥",
                  style: TextStyle(fontSize: 100),
                ),
              ],
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
  double get maxExtent => 80;
  @override
  double get minExtent => 80;
  final appBarSearchController = TextEditingController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        child: AppBarSearchField(
            hintText: AppStrings.todayCoffeSearchText,
            height: 40,
            onSearch: (String) {},
            controller: appBarSearchController),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
