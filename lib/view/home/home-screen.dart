import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/constants/string-constants.dart';
import 'package:movies_application/utils/routes/routes-name.dart';
import 'package:movies_application/view/home/movies/movie-list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.instance.textAppName),
        centerTitle: true,
        leading: IconButton(
            onPressed: () =>
                {Navigator.of(context).pushNamed(RoutesName.onboard)},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.redColor,
            )),
        actions: [
          IconButton(
            onPressed: () =>
                {Navigator.of(context).pushNamed(RoutesName.profile)},
            icon: const Icon(
              Icons.person,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [MovieList()],
        ),
      ),
    );
  }
}
