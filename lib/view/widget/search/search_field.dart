import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final ValueChanged<String> onSearch;
  final TextEditingController controller;

  const SearchField(
      {Key? key,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.borderRadius = 12,
      this.borderColor = AppColors.primary,
      required this.height,
      required this.onSearch,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        cursorColor: AppColors.primary,
        maxLines: 1,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                onSearch(controller.text);
              },
              icon: Icon(
                Icons.search,
                color: AppColors.primary,
              )),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
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
