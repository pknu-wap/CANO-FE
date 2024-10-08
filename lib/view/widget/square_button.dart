import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final double size;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const SquareButton({
    Key? key,
    required this.text,
    required this.size,
    this.borderRadius = 8.0,
    this.borderColor = AppColors.primary,
    this.backgroundColor = Colors.white,
    this.onTap = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 클릭 이벤트 처리
      child: Container(
        width: size, // 정사각형으로 만들기 위해 고정된 크기
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius), // 입력된 모서리 반지름 적용
          border: Border.all(color: borderColor, width: 1), // 외곽선 설정
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black26, // 텍스트 색상
            ),
          ),
        ),
      ),
    );
  }
}
