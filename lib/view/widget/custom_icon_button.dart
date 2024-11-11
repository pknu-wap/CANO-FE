import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvgButton extends StatelessWidget {
  final String imagePath;
  final String? selectedImagePath;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomIconSvgButton(
      {Key? key,
      required this.imagePath,
      this.selectedImagePath = null,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPressed.call();
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(4, 4))
          ]),
          child: SvgPicture.asset(
            imagePath,
            height: height,
            width: width,
          ),
        ));
  }
}

class CustomIconPngButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;
  final bool? idx;
  final bool? selectedIdx;

  const CustomIconPngButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    this.size = 50,
    this.idx,
    this.selectedIdx,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPressed.call();
        }, // 클릭 이벤트 처리
        child: idx == selectedIdx
            ? Image.asset(
                imagePath, // PNG 이미지의 경로
                fit: BoxFit.cover,
                width: size,
                height: size, // 필요에 따라 조정
              )
            : Image.asset(
                imagePath, // PNG 이미지의 경로
                fit: BoxFit.cover,
                color: Colors.black12,
                width: size,
                height: size, // 필요에 따라 조정
              ));
  }
}
