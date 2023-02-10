import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_card/image_card.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/red-button.dart';
import 'package:movies_application/res/components/white-border-button.dart';
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
        Stack(alignment: Alignment.bottomLeft, children: []),
        SizedBox(
          height: height * 0.02,
          width: width,
        ),
        TransparentImageCard(
          width: width,
          height: height * 0.3,
          imageProvider: NetworkImage("${movies['posterurl']}"),
          tags: [
            _tag(movies['genres'][0], () {}),
          ],
          title: _title(color: AppColors.whiteColor),
          description: _content(
              AppColors.whiteColor,
              context,
              RedButton(width: width, height: height),
              WhiteBorderButton(width: width, height: height)),
        ),
      ],
    );
  }

  Widget _title({Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          movies['title'],
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: color),
        ),
        RatingBar.builder(
          initialRating: movies['ratings'][0].toDouble(),
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
          onRatingUpdate: (rating) {
            print(rating);
          },
        )
      ],
    );
  }

  Widget _content(
      Color? color, BuildContext? context, Widget? redButton, whiteButton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context!,
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
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                print(movies);
              },
              child: whiteButton,
            ),
          ],
        ),
        Text(
          movies['year'],
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.redColor),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
