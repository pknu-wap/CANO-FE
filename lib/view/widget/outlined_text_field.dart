import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

late TextEditingController controller;

class OutlinedTextField extends StatefulWidget {
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
  State<OutlinedTextField> createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.initialText.isNotEmpty ? widget.initialText : null, // 초기값 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.primary,
        onChanged: widget.onChanged,
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
        ),
      ),
    );
  }
}
