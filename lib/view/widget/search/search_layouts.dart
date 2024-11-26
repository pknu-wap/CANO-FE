import 'package:cano/utils/format_string.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/view/widget/search/intensity_bar.dart';
import 'package:cano/view/widget/search/star_rating.dart';
import 'package:flutter/material.dart';

import '../../../data/model/menu/menu_info.dart';
import '../../../desginsystem/colors.dart';
import '../../../desginsystem/strings.dart';

class SearchKeyword extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback? onClose;
  final String text;
  final double borderRadius;
  final bool isCano;

  const SearchKeyword({
    super.key,
    required this.onPressed,
    this.onClose,
    required this.text,
    this.isCano = false,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: isCano ? null : const EdgeInsets.only(left: 24, right: 5),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(borderRadius), // 둥근 모서리
          )),
      child: isCano
          ? Text(text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ))
          : Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (onClose != null)
                  TextButton(
                      onPressed: onClose,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(20, 30), // 원하는 크기로 최소 크기 설정
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // 터치 영역 최소화
                      ),
                      child: const Text(
                        "X",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ))
              ],
            ),
    );
  }
}

class MenuInfoLayout extends StatelessWidget {
  final MenuInfo menuInfo;

  const MenuInfoLayout({
    super.key,
    required this.menuInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 메뉴 이미지
            Container(
              width: mediaWidth(context, 0.24),
              height: mediaHeight(context, 0.12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0, 0.1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: menuInfo.imageUrl.isNotEmpty
                    ? Image.network(
                        menuInfo.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/default.png',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/default.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            // 메뉴 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 메뉴 이름과 좋아요 아이콘
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuInfo.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                          menuInfo.isLike!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // 별점 표시
                  Row(
                    children: [
                      Text(
                        (menuInfo.score ?? 0.0).toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 3),
                      StarRating(rating: menuInfo.score ?? 0.0),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "(${menuInfo.scoreCount})",
                        style: const TextStyle(
                            color: Colors.black12, fontSize: 12),
                      )
                    ],
                  ),
                  // 가격 표시
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.price,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${formatWithComma(menuInfo.price)}원",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  // 맛 특성 표시 (Acidity)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.acidity,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.acidity ?? 0.0)
                    ],
                  ),
                  const SizedBox(height: 3),
                  // 맛 특성 표시 (Body)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.body,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.body ?? 0.0)
                    ],
                  ),
                  // 맛 특성 표시 (Bitterness)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.bitterness,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.bitterness ?? 0.0)
                    ],
                  ),
                  const SizedBox(height: 3),
                  // 맛 특성 표시 (Sweetness)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.sweetness,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.sweetness ?? 0.0)
                    ],
                  ),
                  const SizedBox(height: 3),
                  // 아로마 표시
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.aroma,
                        style: TextStyle(fontSize: 12),
                      ),
                      Expanded(
                        child: menuInfo.aromas != null &&
                                menuInfo.aromas!.isNotEmpty
                            ? Wrap(
                                spacing: 8.0,
                                children: menuInfo.aromas!
                                    .where((aroma) =>
                                        menuInfo.aromaCounts != null &&
                                        menuInfo.aromaCounts![aroma] != null &&
                                        menuInfo.aromaCounts![aroma]! > 0)
                                    .map(
                                      (aroma) => Chip(
                                        label: Text(
                                          "$aroma ${menuInfo.aromaCounts![aroma]!}",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        backgroundColor: AppColors.barBg,
                                        side: BorderSide.none,
                                      ),
                                    )
                                    .toList(),
                              )
                            : const Text(
                                "아로마 정보가 없습니다.",
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.primary),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
