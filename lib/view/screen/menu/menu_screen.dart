import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/screen/menu/menu_report_screen.dart';
import 'package:cano/view/widget/menu/flavor_profile_widget.dart';
import 'package:cano/view/widget/menu/rating_breakdown_widget.dart';
import 'package:cano/view/widget/menu/review_card_widget.dart';
import 'package:cano/viewmodel/menu/menu_viewmodel.dart';
import 'package:cano/viewmodel/users_review/users_review_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends ConsumerStatefulWidget {
  final menuId;
  const MenuScreen({super.key, required this.menuId});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(menuProvider.notifier).fetchMenu(widget.menuId);
    ref.read(usersReviewViewModelProvider.notifier).fetchReviews(widget.menuId);
  }

  @override
  Widget build(BuildContext context) {
    final menuData = ref.watch(menuProvider);
    final reviewData = ref.watch(usersReviewViewModelProvider);

    if (menuData == null) {
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
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
            // 메뉴 이미지 표시
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: menuData.imageUrl.isNotEmpty
                        ? NetworkImage(menuData.imageUrl)
                        : const AssetImage('assets/images/default.png')
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 메뉴 이름과 좋아요 아이콘
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    menuData.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      menuData.isLike ?? false
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // 좋아요 기능 구현
                      final menuViewModel = ref.read(menuProvider.notifier);
                      menuViewModel.toggleIsLike();
                      // 추가로 API 호출 등을 통해 서버와 동기화할 수 있습니다.
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // 가격 표시
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.price,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.basicText,
                    ),
                  ),
                  Text(
                    "${menuData.price}원",
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.basicText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // 별점 표시
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
                  Text('(${menuData.scoreCount ?? 0}개)',
                      style: const TextStyle(color: AppColors.secondary)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RatingBreakdownWidget(menuData: menuData),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FlavorProfileWidget(menuData: menuData),
            ),
            const SizedBox(height: 8),
            // 아로마 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    AppStrings.aroma,
                    style: TextStyle(
                      color: AppColors.basicText,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      if (menuData.aromas != null &&
                          menuData.aromas!.isNotEmpty)
                        Wrap(
                          spacing: 8.0,
                          children: menuData.aromas!
                              .where((aroma) =>
                                  menuData.aromaCounts != null &&
                                  menuData.aromaCounts![aroma] != null &&
                                  menuData.aromaCounts![aroma]! > 0)
                              .map(
                            (aroma) {
                              return Chip(
                                label: Text(
                                  "$aroma ${menuData.aromaCounts![aroma]!}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                backgroundColor: AppColors.barBg,
                                side: BorderSide.none,
                              );
                            },
                          ).toList(),
                        )
                      else
                        const Text(
                          "아로마 정보가 없습니다.",
                          style:
                              TextStyle(fontSize: 12, color: AppColors.primary),
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
                children: reviewData.reviews
                    .map((review) => ReviewCardWidget(review: review))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 54,
        child: ElevatedButton(
          onPressed: () {
            context.push("/write_review/${widget.menuId}");
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
              SvgPicture.asset(
                "assets/images/reviewPencil.svg",
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
        menuData.ratingCountsByStar!.isEmpty ||
        menuData.scoreCount == null ||
        menuData.scoreCount == 0) {
      return 0.0;
    }
    int totalRatings = menuData.ratingCountsByStar!.entries
        .fold(0, (sum, entry) => sum + (entry.key * entry.value));
    return totalRatings / menuData.scoreCount!;
  }
}
