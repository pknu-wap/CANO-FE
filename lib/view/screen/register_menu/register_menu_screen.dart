import 'dart:io';

import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../../desginsystem/strings.dart';
import '../../../permission/permission.dart';
import '../../../utils/view/dialog.dart';
import '../../../utils/view/show_toast.dart';
import '../../../viewmodel/register_menu/register_menu_viewmodel.dart';

class RegisterMenuScreen extends ConsumerWidget {
  RegisterMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerMenuRequest = ref.watch(registerMenuProvider);
    final registerAvailable = registerMenuRequest.imageUrl != '' &&
        registerMenuRequest.cafeName != '' &&
        registerMenuRequest.menuName != '' &&
        registerMenuRequest.price != 0;

    ref.listen(registerMenuProvider, (prev, next) {
      print("현재 상태: $next");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    AppStrings.registerMenu,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              AppStrings.cafeName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedTextField(
                hintText: AppStrings.cafeNameHint,
                onChange: (text) =>
                    ref.read(registerMenuProvider.notifier).setCafeName(text)),
            SizedBox(height: 15),
            Text(
              AppStrings.menuName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedTextField(
                hintText: AppStrings.menuNameHint,
                onChange: (text) =>
                    ref.read(registerMenuProvider.notifier).setMenuName(text)),
            SizedBox(height: 15),
            Text(
              AppStrings.priceText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedNumberTextField(
                hintText: AppStrings.priceHint,
                onChange: (text) => ref
                    .read(registerMenuProvider.notifier)
                    .setPrice(text != "" ? int.parse(text) : 0)),
            SizedBox(height: 15),
            Text(
              AppStrings.registerImage,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                registerMenuRequest.imageUrl == ''
                    ? SvgPicture.asset("assets/images/image_template.svg")
                    : Image.file(
                        File(registerMenuRequest.imageUrl),
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Transform.translate(
                    offset: Offset(4, 4),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primary, width: 1.0)),
                      child: IconButton(
                        padding: EdgeInsets.all(2),
                        icon:
                            Icon(Icons.add, size: 15, color: AppColors.primary),
                        onPressed: () async {
                          await getGalleryPermissionStatus()
                              ? ref
                                  .read(registerMenuProvider.notifier)
                                  .pickImageFromGallery(
                                      context,
                                      (imagePath) => ref
                                          .watch(registerMenuProvider.notifier)
                                          .setImageUrl(imagePath))
                              : requestGalleryPermission();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            CustomButtonWihImage(
                text: AppStrings.registerMenu,
                height: 40,
                onPressed: () => registerAvailable
                    ? {
                        showDoubleButtonAlertDialog(
                            context, "메뉴 등록", AppStrings.askToRegisterMenu,
                            onConfirm: () async {
                          await ref
                                  .read(registerMenuProvider.notifier)
                                  .registerMenu()
                              ? () {
                                  // context.pop();
                                  showToast(AppStrings.registerMenuSuccess);
                                }
                              : () => showToast(AppStrings.registerMenuFailure);
                        })
                      }
                    : {},
                buttonColor:
                    registerAvailable ? AppColors.buttonColor : Colors.grey,
                imagePath: 'assets/images/register_menu_icon.svg'),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
