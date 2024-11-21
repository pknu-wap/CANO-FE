
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/utils/mediaquery.dart';
import 'package:cano/view/widget/custom_button.dart';
import 'package:cano/view/widget/search/search_layouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../desginsystem/colors.dart';
import '../../../desginsystem/strings.dart';
import '../../../viewmodel/search/search_viewmodel.dart';

class PreSearchWidget extends ConsumerStatefulWidget {
  PreSearchWidget({super.key});

  @override
  _PreSearchWidgetState createState() => _PreSearchWidgetState();
}

class _PreSearchWidgetState extends ConsumerState<PreSearchWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(searchProvider.notifier).setKeywordList();
  }

  @override
  Widget build(BuildContext context) {
    final keywordList = ref.watch(searchProvider).keywordList;

    return Column(children: [
      SizedBox(height: 40),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 30),
        child: Text(
          AppStrings.recentKeyword,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: keywordList.length,
              itemBuilder: (BuildContext context, int index) {
                return keywordList[index] == ""
                    ? null
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: SearchKeyword(
                          onPressed: () {},
                          onClose: () => ref
                              .read(searchProvider.notifier)
                              .removeKeyword(keywordList[index]),
                          text: keywordList[index],
                          borderRadius: 18,
                        ));
              }),
        ),
      ),
    ]);
  }
}

class PostSearchWidget extends ConsumerWidget {
  const PostSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(AppStrings.searchCoffeeText,
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              TextButton(
                  onPressed: () => context.push('/register_menu'),
                  style: TextButton.styleFrom(overlayColor: Colors.grey),
                  child: Text(
                    AppStrings.addCoffeeText,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: searchState.menuInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: MenuInfoLayout(
                              menuInfo: searchState.menuInfoList[index]),
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// class NoSearchResultWidget extends StatelessWidget {
//   NoSearchResultWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: mediaWidth(context, 0.25),
//           height: mediaHeight(context, 0.25),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//             border: Border.all(
//               color: AppColors.primary,
//               width: 1.5,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               "!",
//               style: TextStyle(
//                 fontSize: 40, // 글자 크기
//                 color: AppColors.primary, // 글자 색
//                 fontWeight: FontWeight.bold, // 글자 굵기
//               ),
//             ),
//           ),
//         ),
//         Transform.translate(
//           offset: Offset(0, -15),
//           child: Text(
//             AppStrings.noSearchResultText,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primary),
//           ),
//         ),
//         SizedBox(height: 30),
//         Text(AppStrings.addCafeText,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.black45,
//             )),
//         SizedBox(height: 15),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: CustomOutlinedButton(
//             onPressed: () {},
//             text: "+",
//             height: 55,
//           ),
//         ),
//       ],
//     );
//   }
// }
