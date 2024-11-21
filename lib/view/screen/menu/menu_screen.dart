import 'package:cano/view/screen/menu/menu_report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/viewmodel/menu/menu_viewmodel.dart';
import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/viewmodel/review/review_viewmodel.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:intl/intl.dart';
import 'package:cano/view/screen/review/write_review_screen.dart';
import 'package:cano/view/widget/menu/flavor_profile_widget.dart';
import 'package:cano/view/widget/menu/rating_breakdown_widget.dart';
import 'package:cano/view/widget/menu/review_card_widget.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuData = ref.watch(menuProvider);
    final reviewData = ref.watch(reviewListProvider);

    double averageRating = _calculateAverageRating(menuData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // '메뉴의 정보가 잘못되었나요?'.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuReportScreen(),
                ),
              );
            },
            child: const Text(
              AppStrings.menuIsWrong,
              style: TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/dolceLatte.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 메뉴 이름, 좋아요
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    menuData.menuName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                    color: AppColors.heart,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            // 가격
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '가격',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.basicText,
                    ),
                  ),
                  Text(
                    '${menuData.price}원',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.basicText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            // 별점
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: AppColors.star),
                  Text(
                    averageRating.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('(${menuData.ratingCount}개)',
                      style: const TextStyle(color: AppColors.secondary)),
                ],
              ),
            ),

            // 별점 별로 정리
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RatingBreakdownWidget(menuData: menuData),
            ),

            const SizedBox(
              height: 16,
            ),

            // 맛
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  Column(children: [FlavorProfileWidget(menuData: menuData)]),
            ),

            const SizedBox(
              height: 8,
            ),

            // 아로마
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "아로마",
                        style: TextStyle(
                          color: AppColors.basicText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 8.0,
                        children: menuData.aromas
                            .where((aroma) =>
                                menuData.aromaCounts?[aroma] != null &&
                                menuData.aromaCounts![aroma]! > 0)
                            .map(
                          (aroma) {
                            return Chip(
                              label: Text(
                                "$aroma ${menuData.aromaCounts![aroma]}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              backgroundColor: AppColors.barBg,
                              side: BorderSide.none,
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),

            // 리뷰 리스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: reviewData
                    .map((review) => ReviewCardWidget(review: review))
                    .toList(),
              ),
            ),

            // Review Button
          ],
        ),
      ),

      // 리뷰 쓰기 버튼(플로팅)
      floatingActionButton: SizedBox(
        width: 150,
        height: 54,
        child: ElevatedButton(
          onPressed: () {
            // 리뷰 작성 화면으로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WriteReviewScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.floatingButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 1.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/reviewPencil.png",
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                '리뷰 쓰기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  double _calculateAverageRating(MenuInfo menuData) {
    if (menuData.ratingCountsByStar == null ||
        menuData.ratingCountsByStar!.isEmpty) {
      return 0.0;
    }
    int totalRatings = menuData.ratingCountsByStar!.entries
        .fold(0, (sum, entry) => sum + (entry.key * entry.value));
    return totalRatings / menuData.ratingCount;
  }
}
