import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

import '../../desginsystem/strings.dart';

void showSingleButtonAlertDialog(
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

void showDoubleButtonAlertDialog(
  BuildContext context,
  String title,
  String message, {
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
        content: Text(
          message,
          style: TextStyle(color: AppColors.primary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            child: Text(AppStrings.confirm,
                style: TextStyle(color: AppColors.primary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(AppStrings.cancle,
                style: TextStyle(color: AppColors.primary)),
          ),
        ],
      );
    },
  );
}
