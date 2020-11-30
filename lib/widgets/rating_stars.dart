import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int raiting;

  RatingStars(this.raiting);

  @override
  Widget build(BuildContext context) {
    String stars = '';

    for (int i = 0; i <= raiting; i++) {
      stars += '🌟';
    }

    return Text(
      stars,
      style: TextStyle(fontSize: 18),
    );
  }
}
