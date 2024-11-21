import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../desginsystem/colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChange;
  final Color fieldColor;

  const RoundedTextField(
      {Key? key,
      required this.hintText,
      required this.onChange,
      this.fieldColor = AppColors.textFieldColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: AppColors.primary,
        minLines: 1,
        onChanged: onChange,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          filled: true,
          fillColor: fieldColor,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ));
  }
}

class RoundedNumberTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChange;
  final Color fieldColor;

  const RoundedNumberTextField(
      {Key? key,
      required this.hintText,
      required this.onChange,
      this.fieldColor = AppColors.textFieldColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: AppColors.primary,
        onChanged: onChange,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          filled: true,
          fillColor: fieldColor,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ));
  }
}
