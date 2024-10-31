import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final String lableText;
  final TextInputType keyboardType;

  const AuthInputField({
    super.key,
    required this.lableText,
    this.keyboardType = TextInputType.text, // 기본값은 일반 텍스트 입력
  });

  @override
  Widget build(BuildContext context) {
    // 비밀번호 여부 판단
    final bool isPassword = keyboardType == TextInputType.visiblePassword;

    return TextField(
      keyboardType: keyboardType,
      obscureText: isPassword,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: lableText,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
