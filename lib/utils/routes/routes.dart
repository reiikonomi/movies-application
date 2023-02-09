import 'package:flutter/material.dart';
import 'package:movies_application/models/movies.model.dart';
import 'package:movies_application/utils/routes/routes-name.dart';
import 'package:movies_application/view/auth/login/login-screen.dart';
import 'package:movies_application/view/auth/register/register-screen.dart';
import 'package:movies_application/view/home/home-screen.dart';
import 'package:movies_application/view/home/movies/details/movie-details.dart';
import 'package:movies_application/view/onboard/onboard-screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegistrationScreen());

      case RoutesName.movieDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MovieDetails());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
