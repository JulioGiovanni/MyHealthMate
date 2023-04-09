import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final double size;

  const RatingStars({super.key, required this.rating, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: size,
        ),
      ),
    );
  }
}
