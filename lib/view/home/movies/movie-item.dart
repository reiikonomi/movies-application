import 'package:flutter/material.dart';
import 'package:movies_application/models/movies.model.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/red-button.dart';
import 'package:movies_application/res/components/white-border-button.dart';
import 'package:movies_application/res/style/text-style.dart';
import 'package:movies_application/view/home/movies/details/movie-details.dart';

class MovieItem extends StatelessWidget {
  final dynamic movies;
  const MovieItem({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.bottomLeft, children: [
          _moviePoster(height, width),
          _movieDetail(width, height, context),
        ]),
        SizedBox(
          height: height * 0.02,
          width: width,
        )
      ],
    );
  }

  Padding _movieDetail(double width, double height, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              width: width * .7,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    movies['title'] == null
                        ? const Text("N/A")
                        : _movieTitle(
                            WhiteBorderButton(width: width, height: height),
                            RedButton(width: width, height: height),
                            context),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .05,
                          ),
                        ])
                  ]),
            ),
          ],
        ));
  }

  Container _movieTitle(whiteButton, redButton, BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movies['title'].toString(),
              style: AppStyle.instance.h4Bold.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(
                            title: movies['title'],
                            year: movies['year'],
                            posterUrl: movies['posterurl'],
                            duration: movies['duration'],
                            averageRating: movies['averagerating'],
                            actors: [movies['actors']],
                            originalTitle: movies['originaltitle'],
                            storyline: movies['storyline'],
                            genres: [movies['genres']],
                            imdbRating: movies['imdbrating'],
                            ratings: [movies['ratings']],
                            releaseDate: movies['releasedate'],
                          ),
                        ),
                      );
                    },
                    child: redButton,
                  ),
                  whiteButton,
                ])
          ],
        ));
  }

  Container _moviePoster(double height, double width) {
    return Container(
      height: height * .45,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: NetworkImage("${movies['posterurl']}"))),
    );
  }
}
