import 'package:flutter/material.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/viewmodel/menu/menu_viewmodel.dart';
import 'package:cano/data/model/menu/menu_info.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuData =
        ref.watch(menuProvider); // Assuming menuProvider fetches the menu data.

    double averageRating = _calculateAverageRating(menuData);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: _buildRatingBreakdown(menuData),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: [
                  _buildFlavorProfile(menuData),
                ]),
              ),

              const SizedBox(
                height: 8,
              ),
              // Tags

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
                              .where(
                                  (aroma) => menuData.aromaCounts[aroma] != 0)
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
              const Divider(),
            ],
          ),
        ),
      ),
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

  //   const Text('리뷰',
  //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //   ..._buildReviewList(),
  //   // Review Button
  //   Align(
  //     alignment: Alignment.bottomCenter,
  //     child: CustomButton(
  //       text: '리뷰 쓰기',
  //       onPressed: () {},
  //       height: 55,
  //       buttonColor: AppColors.floatingButton,
  //     ),
  //   ),

  // List<Widget> _buildReviewList() {
  //   return List.generate(3, (index) {
  //     return ListTile(
  //       leading: CircleAvatar(backgroundColor: Colors.grey.shade300),
  //       title: const Text('유저이름'),
  //       subtitle: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: List.generate(
  //                 5,
  //                 (index) =>
  //                     const Icon(Icons.star, color: AppColors.star, size: 16)),
  //           ),
  //           const Text('커피가 맛있어요~'),
  //         ],
  //       ),
  //       trailing: const Icon(Icons.more_vert),
  //     );
  //   });
  // }
}
