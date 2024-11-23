import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:cano/view/widget/grey_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuReportScreen extends ConsumerStatefulWidget {
  const MenuReportScreen({super.key});

  @override
  ConsumerState<MenuReportScreen> createState() => _MenuReportScreenState();
}

class _MenuReportScreenState extends ConsumerState<MenuReportScreen> {
  String? _selectedOption; // 선택된 라디오 값 저장
  final TextEditingController _textController =
      TextEditingController(); // TextField 값 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.whichPartIsWrong,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  // Radio 버튼 리스트
                  RadioListTile<String>(
                    title: const Text(AppStrings.cafeNameIncorrect),
                    value: AppStrings.cafeNameIncorrect,
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() {
                      _selectedOption = value;
                    }),
                    activeColor: AppColors.floatingButton, // 선택 시 색상
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0), // 왼쪽으로 옮기기
                    visualDensity: const VisualDensity(
                        horizontal: 0, vertical: -2), // 수직 간격 조정
                  ),
                  RadioListTile<String>(
                    title: const Text(AppStrings.menuNameIncorrect),
                    value: AppStrings.menuNameIncorrect,
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() {
                      _selectedOption = value;
                    }),
                    activeColor: AppColors.floatingButton,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0), // 왼쪽으로 옮기기
                    visualDensity: const VisualDensity(
                        horizontal: 0, vertical: -2), // 수직 간격 조정
                  ),
                  RadioListTile<String>(
                    title: const Text(AppStrings.priceIncorrect),
                    value: AppStrings.priceIncorrect,
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() {
                      _selectedOption = value;
                    }),
                    activeColor: AppColors.floatingButton,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0), // 왼쪽으로 옮기기
                    visualDensity: const VisualDensity(
                        horizontal: 0, vertical: -2), // 수직 간격 조정
                  ),
                  RadioListTile<String>(
                    title: const Text(AppStrings.imgIncorrect),
                    value: AppStrings.imgIncorrect,
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() {
                      _selectedOption = value;
                    }),
                    activeColor: AppColors.floatingButton,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0), // 왼쪽으로 옮기기
                    visualDensity: const VisualDensity(
                        horizontal: 0, vertical: -2), // 수직 간격 조정
                  ),
                  RadioListTile<String>(
                    title: const Text(AppStrings.etc),
                    value: AppStrings.etc,
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() {
                      _selectedOption = value;
                    }),
                    activeColor: AppColors.floatingButton,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0), // 왼쪽으로 옮기기
                    visualDensity: const VisualDensity(
                        horizontal: 0, vertical: -2), // 수직 간격 조정
                  ),
                  const SizedBox(height: 16),
                  GreyBgTextField(
                      hintText: AppStrings.reportMenuHint,
                      textController: _textController),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // 제출하기 버튼
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 54,
                margin: const EdgeInsets.only(bottom: 24),
                child: ElevatedButton(
                  onPressed: () {
                    // 선택된 값과 입력된 텍스트를 저장하거나 전송
                    final selectedData = {
                      'selectedOption': _selectedOption,
                      'additionalInfo': _textController.text,
                    };

                    // 결과 확인 로그 (추후 서버 전송 로직 추가 가능)
                    print(selectedData);

                    // 성공 메시지 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(AppStrings.submitMenuReportAlert),
                      ),
                    );

                    // 페이지 닫기
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedOption == null
                        ? Colors.grey
                        : AppColors.floatingButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/submit.png",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        AppStrings.submitMenuReport,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
