import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:cano/view/widget/search/search_widgets.dart';
import 'package:cano/viewmodel/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);

    ref.listen(searchProvider, (prev, next) {
      print("현재 상태: $next");
    });

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
                  onSearch: (String) {
                    ref.watch(searchProvider.notifier).setIsSearched();
                  },
                  controller: searchController),
            ),
            searchState.isSearched
                ? PostSearchWidget(
                    tabText: searchState.tabText,
                    onPressed: (tab) =>
                        ref.watch(searchProvider.notifier).setTabText(tab))
                : PreSearchWidget(),
          ],
        ),
      ),
    );
  }
}
