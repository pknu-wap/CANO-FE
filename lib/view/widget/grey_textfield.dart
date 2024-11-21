import 'package:flutter/material.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';

class GreyBgTextField extends StatelessWidget {
  const GreyBgTextField({
    super.key,
    required this.hintText,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      style: const TextStyle(fontSize: 14),
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.barBorder),
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
        filled: true,
        fillColor: AppColors.barBg,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.barBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.barBorder),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
