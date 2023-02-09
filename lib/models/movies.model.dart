import 'dart:convert';

List<Movies> moviesFromJson(String str) =>
    List<Movies>.from(json.decode(str).map((x) => Movies.fromJson(x)));

String moviesToJson(List<Movies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movies {
  Movies({
    required this.id,
    required this.title,
    required this.year,
    required this.genres,
    required this.ratings,
    required this.poster,
    required this.contentRating,
    required this.duration,
    required this.releaseDate,
    required this.averageRating,
    required this.originalTitle,
    required this.storyline,
    required this.actors,
    required this.imdbRating,
    required this.posterurl,
  });

  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  DateTime releaseDate;
  int averageRating;
  String originalTitle;
  String storyline;
  List<String> actors;
  String imdbRating;
  String posterurl;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        ratings: List<int>.from(json["ratings"].map((x) => x)),
        poster: json["poster"],
        contentRating: json["contentRating"],
        duration: json["duration"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        averageRating: json["averageRating"],
        originalTitle: json["originalTitle"],
        storyline: json["storyline"],
        actors: List<String>.from(json["actors"].map((x) => x)),
        imdbRating: json["imdbRating"],
        posterurl: json["posterurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
        "poster": poster,
        "contentRating": contentRating,
        "duration": duration,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "averageRating": averageRating,
        "originalTitle": originalTitle,
        "storyline": storyline,
        "actors": List<dynamic>.from(actors.map((x) => x)),
        "imdbRating": imdbRating,
        "posterurl": posterurl,
      };
}
