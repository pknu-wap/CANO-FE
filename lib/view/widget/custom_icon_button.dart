import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvgButton extends StatelessWidget {
  final bool? idx;
  final bool? selectedIdx;
  final String? imagePath;
  final String? selectedImagePath;
  final VoidCallback onPressed;
  final double size;

  const CustomIconSvgButton({
    Key? key,
    this.imagePath = null,
    this.selectedImagePath = null,
    required this.onPressed,
    this.size = 50,
    this.idx = null,
    this.selectedIdx = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPressed.call();
        },
        child: idx == selectedIdx
            ? (imagePath != null
                ? SvgPicture.asset(
                    imagePath!,
                    height: size,
                    width: size,
                  )
                : Icon(Icons.man, size: size))
            : Icon(Icons.access_time_filled_rounded, size: size));
  }
}

class CustomIconPngButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;

  const CustomIconPngButton({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      }, // 클릭 이벤트 처리
      child: Image.asset(
        imagePath, // PNG 이미지의 경로
        fit: BoxFit.cover,
        width: size,
        height: size, // 필요에 따라 조정
      ),
    );
  }
}
