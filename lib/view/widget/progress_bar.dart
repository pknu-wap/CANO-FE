import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percent;
  final Color color;

  const ProgressBar({
    Key? key,
    required this.percent,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // 가로 꽉 채우기
          height: 20, // ProgressBar 높이
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // 모서리 둥글게
            color: Colors.white, // 배경색
            border: Border.all(color: color, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              widthFactor: percent, // 진행률에 따라 너비 조정
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // 모서리 둥글게
                  color: color, // ProgressBar 색상
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
