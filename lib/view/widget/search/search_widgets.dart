import 'package:cano/desginsystem/colors.dart';
import 'package:cano/util/mediaquery.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/search/search_keyword.dart';
import 'package:flutter/material.dart';

import '../../../data/model/menu_info.dart';
import '../../../desginsystem/strings.dart';

class PreSearchWidget extends StatelessWidget {
  PreSearchWidget({super.key});

  final List<String> coffeLabels = [
    AppStrings.americano,
    AppStrings.espresso,
    AppStrings.cappuccino,
    AppStrings.caffemoca,
    AppStrings.caffelatte,
    AppStrings.caramelMacchiato
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 40),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 30),
        child: Text(
          AppStrings.recentKeyword,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeLabels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0), // 아이템 간의 여백

                    child: SearchKeyword(
                      onPressed: () {},
                      text: coffeLabels[index],
                      borderRadius: 18,
                    ));
              }),
        ),
      ),
      SizedBox(height: 30),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 30),
        child: Text(
          AppStrings.canoKeyword,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Wrap(
          spacing: 8.0, // 가로 여백
          runSpacing: 8.0, // 세로 여백
          children: coffeLabels.map((keyword) {
            return Container(
              height: 35,
              child: SearchKeyword(
                onPressed: () {},
                text: keyword,
                borderRadius: 18,
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}

class PostSearchWidget extends StatelessWidget {
  final String tabText;
  const PostSearchWidget({Key? key, required this.tabText}) : super(key: key);

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
            children: [
              CustomOutlinedButton2(
                  text: AppStrings.cafe,
                  width: mediaWidth(context, 0.2),
                  height: 40,
                  tabText: "까페"),
              SizedBox(
                width: 10,
              ),
              CustomOutlinedButton2(
                  text: AppStrings.menu,
                  width: mediaWidth(context, 0.2),
                  height: 40,
                  tabText: "까페")
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(0, -25),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical, // 가로로 스크롤
              itemCount: 10, // 아이템 수
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    child: MenuInfoLayout(
                        menuInfo: MenuInfo(
                      cafeName: '스타벅스',
                      menuName: '아메리카노',
                      menuInfoText: '맛있음',
                      price: 4500,
                      rating: 5.0,
                      ratingCount: 300,
                      isLike: true,
                      likeCount: 150,
                      menuImageUrl: '',
                    )),
                  ),
                  // child: Container(
                  //     // 아이템 간의 여백
                  //     child: CafeInfoLayout(
                  //         cafeInfo: CafeInfo(
                  //   cafeName: '스타벅스 경성대점',
                  //   rating: 5.0,
                  //   isLike: true,
                  //   likeCount: 200,
                  //   ratingCount: 59,
                  //   cafeImageUrl: '',
                  // ))),
                );
              }),
        ),
      ],
    );
  }
}

class NoSearchResultWidget extends StatelessWidget {
  NoSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: mediaWidth(context, 0.25),
          height: mediaHeight(context, 0.25),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              "!",
              style: TextStyle(
                fontSize: 40, // 글자 크기
                color: AppColors.primary, // 글자 색
                fontWeight: FontWeight.bold, // 글자 굵기
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -15),
          child: Text(
            AppStrings.noSearchResultText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ),
        SizedBox(height: 30),
        Text(AppStrings.addCafeText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            )),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomOutlinedButton(
            onPressed: () {},
            text: "+",
            height: 55,
          ),
        ),
      ],
    );
  }
}
