import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSvgButton extends StatelessWidget {
  final bool? idx;
  final bool? selectedIdx;
  final String? imagePath;
  final VoidCallback onPressed;
  final double size;

  const CustomIconSvgButton({
    super.key,
    this.imagePath,
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
        },
        child: imagePath != null
            ? SvgPicture.asset(
                imagePath!,
                height: size,
                width: size,
              )
            : Icon(Icons.man, size: size));
  }
}

class CustomIconPngButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;

  const CustomIconPngButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    this.size = 50,
  });

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
