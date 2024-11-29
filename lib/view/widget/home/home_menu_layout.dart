import 'package:cano/utils/mediaquery.dart';
import 'package:cano/view/widget/search/star_rating.dart';
import 'package:flutter/material.dart';

import '../../../data/model/home/home_menu.dart';

class HomeMenuLayout extends StatelessWidget {
  final HomeMenu menu;

  const HomeMenuLayout({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaWidth(context, 0.3),
      height: mediaHeight(context, 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(menu.imageUrl,
                height: mediaHeight(context, 0.15),
                width: mediaWidth(context, 0.3),
                fit: BoxFit.fill),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              "${menu.name}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          StarRating(rating: menu.score ?? 0),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(menu.attribute),
              Text(menu.degree != null
                  ? "${(menu.degree! * 100).toInt()}%"
                  : "0")
            ],
          )
        ],
      ),
    );
  }
}
