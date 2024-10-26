import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed; // 버튼 클릭 시 실행할 콜백 함수
  final String text; // 버튼 텍스트
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        disabledBackgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // 둥근 모서리
        ),
        minimumSize: width == null ? Size(double.infinity, height) : null,
        fixedSize: width != null ? Size(width!, height) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15, color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color unselectedButtonColor;
  final Color selectedButtonColor;
  final Color unselectedTextColor;
  final Color selectedTextColor;
  final double borderRadius;
  final double width;
  final double height;
  final bool isSelected;

  const CustomButton2(
      {super.key,
      required this.onPressed,
      required this.text,
      this.borderRadius = 12.0,
      required this.width,
      required this.height,
      this.unselectedButtonColor = Colors.white,
      this.selectedButtonColor = AppColors.primary,
      this.unselectedTextColor = AppColors.primary,
      this.selectedTextColor = Colors.white,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? selectedButtonColor : unselectedButtonColor,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSelected ? Colors.transparent : selectedButtonColor),
            borderRadius: BorderRadius.circular(borderRadius), // 둥근 모서리
          )),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            color: isSelected ? selectedTextColor : unselectedTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
