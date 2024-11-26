import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  final String? imagePath; // 프로필 이미지 URL
  final double radius; // 반지름

  const ProfileImage({
    Key? key,
    this.radius = 45.0,
    this.imagePath = null, // 기본 반지름 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CircleAvatar(
          radius: radius, // 반지름 설정
          child: ClipOval(
            child: Image.file(
              File(imagePath!),
              fit: BoxFit.cover,
              width: radius * 2,
              height: radius * 2,
            ),
          ));
    }
    return SvgPicture.asset(
      "assets/imagegs/deafult_user_profile.svg",
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.fill,
    );
  }
}

class ProfileImage2 extends StatelessWidget {
  final String? imagePath; // 프로필 이미지 URL
  final double radius; // 반지름

  const ProfileImage2({
    Key? key,
    this.radius = 45.0,
    this.imagePath = null, // 기본 반지름 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CircleAvatar(
          radius: radius, // 반지름 설정
          child: ClipOval(
            child: Image.network(
              imagePath!,
              fit: BoxFit.cover,
              width: radius * 2,
              height: radius * 2,
            ),
          ));
    }
    return SvgPicture.asset(
      "assets/imagegs/deafult_user_profile.svg",
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.fill,
    );
  }
}
