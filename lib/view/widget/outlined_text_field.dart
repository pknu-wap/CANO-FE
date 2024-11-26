import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String hintText;
  final String initialText;
  final TextInputType keyboardType;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final ValueChanged<String> onChanged;

  const OutlinedTextField({
    super.key,
    this.initialText = "",
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 12,
    this.borderColor = AppColors.primary,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: initialText.isNotEmpty ? initialText : null, // 초기값 설정
    );

    return Container(
      height: height,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.primary,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
