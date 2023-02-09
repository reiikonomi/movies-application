import 'dart:convert';

import 'package:movies_application/data/network/network-api-services.dart';
import 'package:movies_application/models/movies.model.dart';
import 'package:movies_application/res/app-url.dart';

class HomeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getMovie() async {
    try {
      // dynamic response = await _apiServices.get(AppUrl.moviesBaseUrl);
      //  response = Movies.fromJson(response);

      dynamic response = await _apiServices.get(AppUrl.moviesBaseUrl);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
