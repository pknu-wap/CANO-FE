import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl; // 프로필 이미지 URL
  final double radius; // 반지름

  const ProfileImage({
    Key? key,
    this.imageUrl = null,
    this.radius = 45.0, // 기본 반지름 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius, // 반지름 설정
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              ),
            )
          : Icon(
              Icons.person, // 기본 아이콘
              size: radius, // 아이콘 크기
            ),
    );
  }
}
