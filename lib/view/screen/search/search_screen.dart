import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/search/search_field.dart';
import 'package:cano/view/widget/search/search_widgets.dart';
import 'package:cano/viewmodel/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    final notifier = ref.read(searchProvider.notifier);
    await notifier.setUserName();
    await notifier.setKeywordList();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);

    ref.listen(searchProvider, (prev, next) {
      print("현재 상태 userName : ${next.userName}");
      print("현재 상태 menuInfoList: ${next.menuInfoList}");
      print("현재 상태 keywordList: ${next.keywordList}");
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        print("현재 상태 뒤로가기");
        if (searchState.isSearched)
          ref.read(searchProvider.notifier).setIsSearched(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 65),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SearchField(
                    hintText:
                        "${searchState.userName}${AppStrings.todayCoffeSearchSCript}",
                    height: 50,
                    borderRadius: 30,
                    onSearch: (String) {
                      ref.read(searchProvider.notifier).setIsSearched(true);
                      ref.read(searchProvider.notifier).saveKeyword(String);
                      ref
                          .read(searchProvider.notifier)
                          .searchWithKeyword(String);
                    },
                    controller: searchController),
              ),
              searchState.isSearched ? PostSearchWidget() : PreSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
