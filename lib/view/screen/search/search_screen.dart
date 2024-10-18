import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:cano/view/widget/search/search_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 65),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text(
                AppStrings.search,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.primary),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SearchField(
                  hintText: AppStrings.todayCoffeSearchText,
                  height: 50,
                  borderRadius: 30,
                  onSearch: (String) {},
                  controller: searchController),
            ),
            PostSearchWidget(tabText: "까페")
          ],
        ),
      ),
    );
  }
}
