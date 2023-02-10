import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_card/image_card.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/red-button.dart';
import 'package:movies_application/res/components/white-border-button.dart';
import 'package:movies_application/utils/routes/routes-name.dart';
import 'package:movies_application/view/home/movies/components/rating.dart';
import 'package:movies_application/view/home/movies/details/movie-details.dart';
import 'package:movies_application/view/home/profile/profile-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieItem extends StatelessWidget {
  final dynamic movies;
  final String buttonText;
  const MovieItem({Key? key, required this.movies, required this.buttonText})
      : super(key: key);

  _saveToWatchList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var previousIds = prefs.getStringList('watchList') ?? [];
    if (previousIds.contains(id)) {
      Fluttertoast.showToast(
          msg: "Already added to watch list",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else {
      Fluttertoast.showToast(
          msg: "Succesfully added to watch list",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      await prefs.setStringList("watchList", [...previousIds, id]);
    }
  }

  _remmoveFromWatchList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var previousIds = prefs.getStringList('watchList') ?? [];

    previousIds.removeWhere((element) => element == id);
    await prefs.setStringList("watchList", previousIds);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              WhiteBorderButton(
                width: width,
                height: height,
                text: buttonText,
              )),
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
        Rating(ratings: movies['ratings']),
      ],
    );
  }

  Widget _content(
      Color? color, BuildContext context, Widget? redButton, whiteButton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(
                      id: movies['id'],
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
                if (buttonText == 'Save') {
                  _saveToWatchList(movies['id']);
                }
                if (buttonText == 'Remove') {
                  _remmoveFromWatchList(movies['id']);
                  Navigator.of(context).pushNamed(RoutesName.profile);
                }
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
