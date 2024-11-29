import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:flutter/material.dart';

class RatingBreakdownWidget extends StatelessWidget {
  final MenuInfo menuData;

  const RatingBreakdownWidget({Key? key, required this.menuData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (menuData.ratingCountsByStar == null ||
        menuData.ratingCountsByStar!.isEmpty) {
      return const SizedBox.shrink();
    }


    final int total = menuData.scoreCount ?? 0;

    return Column(
      children: menuData.ratingCountsByStar!.entries.map((entry) {
        final star = entry.key;
        final count = entry.value;
        final int percentage = (total > 0) ? ((count / total) * 100).toInt() : 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Text('$star', style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: AppColors.star, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: total > 0 ? (count / total) : 0,
                  backgroundColor: AppColors.barBg,
                  color: AppColors.star,
                ),
              ),
              const SizedBox(width: 8),
              Text("$percentage%"),
            ],
          ),
        );
      }).toList(),
    );
  }
}
