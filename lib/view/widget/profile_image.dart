import 'dart:io';

import 'package:flutter/material.dart';

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
    return CircleAvatar(
      radius: radius, // 반지름 설정
      child: imagePath != null
          ? ClipOval(
              child: Image.file(
                File(imagePath!),
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              ),
            )
          : Icon(Icons.person, size: 40 // 기본 아이콘
              ),
    );
  }
}
