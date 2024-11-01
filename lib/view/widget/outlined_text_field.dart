import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final ValueChanged<String> onChanged;
  // final TextEditingController controller;

  const OutlinedTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 12,
    this.borderColor = AppColors.primary,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
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
