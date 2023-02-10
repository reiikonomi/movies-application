import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final List<dynamic> ratings;

  const Rating({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: ratings[0].toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 25,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      unratedColor: Colors.white,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
