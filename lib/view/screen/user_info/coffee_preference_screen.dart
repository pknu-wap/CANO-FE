import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class CoffeePreferenceScreen extends StatelessWidget {
  CoffeePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 65),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(percent: 0.5)),
        SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.coffeePreferenceText,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.coffeePreferenceInfoText,
                style: TextStyle(color: Colors.black26, fontSize: 12)),
          ),
        ),
        SizedBox(height: 35),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.americano,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.espresso,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.cappuccino,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.caffemoca,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.caffelatte,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          child: CustomContainerButton(
              text: AppStrings.caffemoca,
              width: 170,
              height: 40,
              borderRadius: 80),
        ),
        SizedBox(height: 170),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(
            text: AppStrings.next,
            minimumSize: 55,
          ),
        )
      ],
    ));
  }
}
