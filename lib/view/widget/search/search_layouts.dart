import 'package:cano/data/model/cafe_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/model/menu_info.dart';
import '../../../desginsystem/colors.dart';

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

class CafeInfoLayout extends StatelessWidget {
  final CafeInfo cafeInfo;

  const CafeInfoLayout({
    Key? key,
    required this.cafeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipOval(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.red,
                child: SvgPicture.asset("assets/images/starbucks_icon.svg"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cafeInfo.cafeName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      cafeInfo.rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(${cafeInfo.ratingCount})",
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.heart_broken,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(cafeInfo.likeCount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.heart_broken, color: Colors.red),
            )
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.black, // 검은색
          thickness: 1.0, // 두께
          height: 20.0, // 수직 여백
        ),
      ],
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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10, // 그림자 흐림 반경
                      offset: Offset(0, 1), // 그림자 위치
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // 둥근 모서리에 맞추기
                  child: Image.asset(
                    'assets/images/americano.png',
                    fit: BoxFit.cover, // 이미지 크기 조정
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        menuInfo.menuName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${menuInfo.price}원",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(${menuInfo.cafeName})",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    menuInfo.menuInfoText,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        menuInfo.rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(${menuInfo.ratingCount})",
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(menuInfo.likeCount.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.heart_broken, color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Colors.black, // 검은색
          thickness: 1.0, // 두께
          height: 20.0, // 수직 여백
        ),
      ],
    );
  }
}
