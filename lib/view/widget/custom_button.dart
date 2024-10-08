import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed; // 버튼 클릭 시 실행할 콜백 함수
  final String text; // 버튼 텍스트
  final Color buttonColor;
  final double borderRadius;
  final double minimumSize;

  const CustomButton(
      {Key? key,
      this.onPressed = null,
      required this.text,
      this.buttonColor = AppColors.primary,
      this.borderRadius = 12.0,
      this.minimumSize = 45})
      : super(key: key);

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
          minimumSize: Size(double.infinity, minimumSize)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomContainerButton extends StatelessWidget {
  final VoidCallback? onPressed; // 버튼 클릭 시 실행할 콜백 함수
  final String text; // 버튼 텍스트
  final Color buttonColor;
  final double borderRadius;
  final double width;
  final double height;

  const CustomContainerButton(
      {Key? key,
      this.onPressed = null,
      required this.text,
      this.buttonColor = AppColors.primary,
      this.borderRadius = 12.0,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            disabledBackgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius), // 둥근 모서리
            )),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
