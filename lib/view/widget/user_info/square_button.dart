import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final int age;
  final int selectedAge;
  final String text;
  final double size;
  final double borderRadius;
  final Color unselectedButtonColor;
  final Color selectedButtonColor;
  final Color unselectedTextColor;
  final Color selectedTextColor;
  final Color borderColor;
  final VoidCallback onTap;
  final VoidCallback onClear;

  const SquareButton({
    Key? key,
    required this.age,
    required this.text,
    required this.size,
    this.unselectedTextColor = Colors.black26,
    this.selectedTextColor = Colors.white,
    this.unselectedButtonColor = Colors.white,
    this.selectedButtonColor = AppColors.primary,
    this.borderRadius = 8.0,
    this.borderColor = AppColors.primary,
    required this.onTap,
    required this.onClear,
    required this.selectedAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (age == selectedAge)
          onClear.call();
        else
          onTap.call();
      }, // 클릭 이벤트 처리
      child: Container(
        width: size, // 정사각형으로 만들기 위해 고정된 크기
        height: size,
        decoration: BoxDecoration(
          color:
              age == selectedAge ? selectedButtonColor : unselectedButtonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                color: age == selectedAge
                    ? selectedTextColor
                    : unselectedTextColor,
                fontWeight: FontWeight.bold // 텍스트 색상
                ),
          ),
        ),
      ),
    );
  }
}
