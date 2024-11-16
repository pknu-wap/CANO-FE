import 'package:cano/utils/mediaquery.dart';
import 'package:flutter/material.dart';

import '../../../desginsystem/colors.dart';

class IntensityBar extends StatelessWidget {
  final double intensity;

  const IntensityBar({super.key, required this.intensity});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      Container(
        width: mediaWidth(context, 0.4),
        height: 15,
        child: FractionallySizedBox(
          alignment: Alignment.centerRight,
          widthFactor: intensity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: AppColors.barColor,
            ),
          ),
        ),
      ),
      Text(
        "${(intensity * 100).toString()}%",
        style: TextStyle(
          fontSize: 12,
          color: AppColors.primary,
        ),
      )
    ]);
  }
}
