import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

void showCustomAlertDialog(
  BuildContext context,
  String title,
  String message,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: AppColors.primary),
        ),
        content: Text(message, style: TextStyle(color: AppColors.primary)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      );
    },
  );
}
