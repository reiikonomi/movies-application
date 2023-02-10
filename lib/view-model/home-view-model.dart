import 'package:flutter/cupertino.dart';
import 'package:movies_application/data/response/api-response.dart';
import 'package:movies_application/repository/home-repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _movieRepo = HomeRepository();

  ApiResponse<List<dynamic>> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<List<dynamic>> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    await _movieRepo.getMovie().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setMoviesList(ApiResponse.error(error.toString())));
  }
}
