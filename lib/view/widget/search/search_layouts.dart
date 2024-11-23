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
    Key? key,
    required this.onPressed,
    this.onClose = null,
    required this.text,
    this.isCano = false,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: isCano ? null : EdgeInsets.only(left: 24, right: 5),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(borderRadius), // 둥근 모서리
          )),
      child: isCano
          ? Text(text,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ))
          : Container(
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: onClose,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(20, 30), // 원하는 크기로 최소 크기 설정
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // 터치 영역 최소화
                      ),
                      child: Text(
                        "X",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}

class MenuInfoLayout extends StatelessWidget {
  final MenuInfo menuInfo;

  const MenuInfoLayout({
    Key? key,
    required this.menuInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaWidth(context, 0.24),
              height: mediaHeight(context, 0.12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0, 0.1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/coffee_ex.png',
                ),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuInfo.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                          menuInfo.isLike
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        menuInfo.score.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 3),
                      StarRating(rating: menuInfo.score),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "(${menuInfo.scoreCount})",
                        style: TextStyle(color: Colors.black12, fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.price,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "${formatWithComma(menuInfo.price)}원",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.acidity,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.acidity)
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.body,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.body)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.bitterness,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.bitterness)
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.sweetness,
                        style: TextStyle(fontSize: 12),
                      ),
                      IntensityBar(intensity: menuInfo.sweetness)
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.aroma,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        joinWithComma(menuInfo.aromas),
                        style:
                            TextStyle(fontSize: 12, color: AppColors.primary),
                      )
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
