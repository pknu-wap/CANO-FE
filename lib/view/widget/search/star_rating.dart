import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Stack(
          children: [
            Icon(
              Icons.star,
              color: Colors.black26,
              size: 14,
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: (rating - index).clamp(0.0, 1.0),
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 14,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
