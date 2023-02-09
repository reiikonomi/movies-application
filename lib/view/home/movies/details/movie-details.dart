import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails(
      {super.key,
      this.title,
      this.posterUrl,
      this.year,
      this.duration,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.imdbRating,
      this.genres,
      this.actors,
      this.releaseDate,
      this.ratings});

  final String? title;
  final String? posterUrl;
  final String? year;
  final String? duration;
  final int? averageRating;
  final String? originalTitle;
  final String? storyline;
  final String? imdbRating;
  final List<String>? genres;
  final List<String>? actors;
  final DateTime? releaseDate;
  final List<int>? ratings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            title!,
            style: const TextStyle(color: AppColors.whiteColor),
          ),
          Text(year!, style: const TextStyle(color: AppColors.whiteColor))
        ],
      ),
    );
  }
}
