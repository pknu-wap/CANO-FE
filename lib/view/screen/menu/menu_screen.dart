import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/viewmodel/menu/menu_viewmodel.dart';
import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/viewmodel/review/review_viewmodel.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:intl/intl.dart';
import 'package:cano/view/screen/review/write_review_screen.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuData = ref.watch(menuProvider);
    final reviewData = ref.watch(reviewListProvider);

    double averageRating = _calculateAverageRating(menuData);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),

            // 상단
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: () => context.pop(),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.menuIsWrong,
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
              ],
            ),
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
              child: Column(
                children: _buildRatingBreakdown(menuData),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // 맛
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(children: [
                _buildFlavorProfile(menuData),
              ]),
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
                        children: menuData.aroma
                            .where((aroma) => menuData.aromaCounts[aroma] != 0)
                            .map(
                          (aroma) {
                            return Chip(
                              label: Text(
                                "$aroma ${menuData.aromaCounts[aroma]}",
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
                children: [
                  ..._buildReviewList(reviewData),
                ],
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
                builder: (context) => const WriteReviewScreen(),
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

  List<Widget> _buildRatingBreakdown(MenuInfo menuData) {
    return [
      _buildRatingRow(5, menuData.ratingCountsByStar[5]!, menuData.ratingCount),
      _buildRatingRow(4, menuData.ratingCountsByStar[4]!, menuData.ratingCount),
      _buildRatingRow(3, menuData.ratingCountsByStar[3]!, menuData.ratingCount),
      _buildRatingRow(2, menuData.ratingCountsByStar[2]!, menuData.ratingCount),
      _buildRatingRow(1, menuData.ratingCountsByStar[1]!, menuData.ratingCount),
    ];
  }

  Widget _buildRatingRow(int star, int ratingCountsByStar, int ratingCount) {
    double ratingVal =
        ratingCountsByStar / ratingCount; // value between 0.0 and 1.0
    double ratingPercentage = ratingVal * 100; // For display purposes
    return Row(
      children: [
        Text('$star', style: const TextStyle(fontSize: 16)),
        const Icon(Icons.star, color: AppColors.star, size: 16),
        Expanded(
          child: LinearProgressIndicator(
            value: ratingVal,
            backgroundColor: AppColors.barBg,
            color: AppColors.star,
          ),
        ),
        Text("${ratingPercentage.toInt()}%"),
      ],
    );
  }

  Widget _buildFlavorProfile(MenuInfo menuData) {
    final attributes = [
      {
        'label': '산미',
        'value': menuData.flavorCounts['산미'],
        'percentValue': menuData.flavorCounts['산미'],
        'percentText': "${(menuData.flavorCounts['산미']! * 100).toInt()}%"
      },
      {
        'label': '바디감',
        'value': menuData.flavorCounts['바디감'],
        'percentValue': menuData.flavorCounts['바디감'],
        'percentText': "${(menuData.flavorCounts['바디감']! * 100).toInt()}%"
      },
      {
        'label': '쓴맛',
        'value': menuData.flavorCounts['쓴맛'],
        'percentValue': menuData.flavorCounts['쓴맛'],
        'percentText': "${(menuData.flavorCounts['쓴맛']! * 100).toInt()}%"
      },
      {
        'label': '달달함',
        'value': menuData.flavorCounts['달달함'],
        'percentValue': menuData.flavorCounts['달달함'],
        'percentText': "${(menuData.flavorCounts['달달함']! * 100).toInt()}%"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.map((attr) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  attr['label'] as String,
                  style: const TextStyle(
                    color: AppColors.basicText,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 200,
                  height: 15,
                  child: LinearProgressIndicator(
                    value: attr['value'] as double,
                    color: AppColors.bar,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  attr['percentText'].toString(),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  double _calculateAverageRating(MenuInfo menuData) {
    int totalScore = 0;
    int totalRatings = 0;

    menuData.ratingCountsByStar.forEach((star, count) {
      totalScore += star * count;
      totalRatings += count;
    });

    if (totalRatings == 0) {
      return 0.0;
    } else {
      return totalScore / totalRatings;
    }
  }

  List<Widget> _buildReviewList(List<ReviewInfo> reviewList) {
    return reviewList.map((review) {
      return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 첫 번째 행: 아바타, 유저 정보, 더보기 아이콘
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 유저 아바타
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Text(
                      review.userName.isNotEmpty ? review.userName[0] : 'U',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 유저 정보 (이름, 날짜, 별점)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('yyyy.MM.dd').format(review.timestamp),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(
                            int.parse(review.rating),
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.star,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 더보기 아이콘
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      // 더보기 버튼 클릭 시 동작 구현
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 리뷰 텍스트
              Text(
                review.reviewText,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              // 리뷰 이미지 (있을 경우)
              if (review.reviewImageUrl.isNotEmpty &&
                  review.reviewImageUrl.any((url) => url.isNotEmpty)) ...[
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: review.reviewImageUrl.length,
                    itemBuilder: (context, index) {
                      final imageUrl = review.reviewImageUrl[index];
                      if (imageUrl.isEmpty) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey.shade300,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.star,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }).toList();
  }
}
