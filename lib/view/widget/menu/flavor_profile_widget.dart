import 'package:flutter/material.dart';
import 'package:cano/data/model/menu/menu_info.dart';
import '../../../desginsystem/colors.dart';

class FlavorProfileWidget extends StatelessWidget {
  final MenuInfo menuData;

  const FlavorProfileWidget({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    final attributes = [
      {'label': '산미', 'value': menuData.acidity},
      {'label': '바디감', 'value': menuData.body},
      {'label': '쓴맛', 'value': menuData.bitterness},
      {'label': '달달함', 'value': menuData.sweetness},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.map((attr) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  attr['label'] as String,
                  style: const TextStyle(
                    color: AppColors.basicText,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 200,
                  height: 15,
                  child: LinearProgressIndicator(
                    value: attr['value'] as double,
                    color: AppColors.bar,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  // 퍼센트
                  (attr['value'] != 0)
                      ? '${((attr['value'] as double) * 100).toStringAsFixed(0)}%'
                      : '정보 없음',

                  style: TextStyle(
                      color: (attr['value'] == 0)
                          ? AppColors.secondary
                          : AppColors.basicText),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFlavorProfile(MenuInfo menuData) {
    final attributes = [
      {'label': '산미', 'value': menuData.acidity},
      {'label': '바디감', 'value': menuData.body},
      {'label': '쓴맛', 'value': menuData.bitterness},
      {'label': '달달함', 'value': menuData.sweetness},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.map((attr) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  attr['label'] as String,
                  style: const TextStyle(
                    color: AppColors.basicText,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 200,
                  height: 15,
                  child: LinearProgressIndicator(
                    value: attr['value'] as double,
                    color: AppColors.bar,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  // 퍼센트
                  (attr['value'] != 0)
                      ? '${((attr['value'] as double) * 100).toStringAsFixed(0)}%'
                      : '정보 없음',

                  style: TextStyle(
                      color: (attr['value'] == 0)
                          ? AppColors.secondary
                          : AppColors.basicText),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
