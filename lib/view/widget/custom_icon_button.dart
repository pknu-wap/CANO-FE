import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvgButton extends StatelessWidget {
  final bool? idx;
  final bool? selectedIdx;
  final String? imagePath;
  final VoidCallback onPressed;
  final double size;

  const CustomIconSvgButton({
    Key? key,
    this.imagePath = null,
    required this.onPressed,
    this.size = 40,
    this.idx = null,
    this.selectedIdx = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPressed.call();
        },
        child: imagePath != null
            ? SvgPicture.asset(
                imagePath!,
              )
            : Icon(Icons.man, size: size));
  }
}

// class CustomIconPngButton extends StatelessWidget {
//   final String imagePath; // 이미지 경로
//   final VoidCallback? onPressed; // 클릭 시 호출될 함수
//
//   const CustomIconSvgButton({
//     Key? key,
//     required this.imagePath,
//     this.onPressed = null,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed, // 클릭 이벤트 처리
//       child: SvgPicture.asset(
//         imagePath,
//       ),
//     );
//   }
// }
