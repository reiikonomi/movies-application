import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/white-border-button.dart';
import 'package:movies_application/res/style/text-style.dart';
import 'package:movies_application/utils/routes/routes-name.dart';

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
  final List? genres;
  final List? actors;
  final DateTime? releaseDate;
  final List? ratings;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.redColor,
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => {Navigator.of(context).pushNamed(RoutesName.home)},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.redColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.blackColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.4,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(posterUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title!,
                          style: AppStyle.instance.h2Bold,
                        ),
                        WhiteBorderButton(width: width, height: height),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(year!, style: AppStyle.instance.h2Bold),
                        RatingBar.builder(
                          initialRating: ratings![0][0].toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.white,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                    Text(
                      'Genres:',
                      style: AppStyle.instance.h5Bold,
                    ),
                    Container(
                      height: 40,
                      width: width,
                      color: Colors.transparent,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: genres![0].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.redColor,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(genres![0][index],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor)),
                              ),
                            );
                          }),
                    ),
                    Text(
                      'Actors:',
                      style: AppStyle.instance.h5Bold,
                    ),
                    Container(
                      height: 40,
                      width: width,
                      color: Colors.transparent,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: actors![0].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.redColor,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(actors![0][index],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor)),
                              ),
                            );
                          }),
                    ),
                    Text(
                      storyline!,
                      style: AppStyle.instance.h5Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
