import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/custom_icon_button.dart';
import 'package:cano/view/widget/outlined_text_field.dart';
import 'package:cano/view/widget/profile_image.dart';
import 'package:cano/view/widget/progress_bar.dart';
import 'package:cano/view/widget/square_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 65),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ProgressBar(percent: 0.25)),
        SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.profileText,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.profileInfoText,
                style: TextStyle(color: Colors.black26, fontSize: 12)),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 30),
            ProfileImage(),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.nickname,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  OutlinedTextField(
                      hintText: AppStrings.nickname,
                      borderRadius: 50,
                      width: 200,
                      height: 45),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconSvgButton(
                  size: 60,
                ),
                Text(AppStrings.man)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconSvgButton(
                  size: 60,
                ),
                Text(AppStrings.woman)
              ],
            )
          ],
        ),
        SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              width: 70,
            ),
            SquareButton(text: "10대", size: 85),
            SizedBox(width: 10),
            SquareButton(text: "20대", size: 85),
            SizedBox(width: 10),
            SquareButton(text: "30대", size: 85)
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: 70,
            ),
            SquareButton(text: "40대", size: 85),
            SizedBox(width: 10),
            SquareButton(text: "50대", size: 85),
            SizedBox(width: 10),
            SquareButton(text: "60대\n이상", size: 85)
          ],
        ),
        SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(
            text: AppStrings.next,
            minimumSize: 55,
            onPressed: () {
              context.go('/coffee_preference');
            },
          ),
        )
      ],
    ));
  }
}
