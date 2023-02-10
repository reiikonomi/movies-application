// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/models/user.model.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/white-border-button.dart';
import 'package:movies_application/res/style/text-style.dart';
import 'package:movies_application/utils/routes/routes-name.dart';
import 'package:movies_application/view-model/home-view-model.dart';
import 'package:movies_application/view/home/movies/movie-item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  UserModel userModel = UserModel();

  List<dynamic> savedMovies = [];
  int? length;

  @override
  void initState() {
    getUserData(FirebaseAuth.instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    FirebaseAuth auth = FirebaseAuth.instance;

    void logout() async {
      auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.redColor,
        title: const Text("Profile"),
        centerTitle: true,
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
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${userModel.firstName} ${userModel.secondName}',
                  style: AppStyle.instance.h4Bold),
              Text('${userModel.email}', style: AppStyle.instance.h4Bold),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: WhiteBorderButton(
                      width: width, height: height, text: "Logout"),
                  onTap: () => {
                    logout(),
                    Navigator.of(context).pushNamed(RoutesName.login)
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Watchlist:', style: AppStyle.instance.bodyMedium),
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: savedMovies.toList().length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movies: savedMovies.toList()[index],
                      buttonText: 'Remove',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getUserData(auth) async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = auth.currentUser;
      await homeViewViewModel.fetchMoviesListApi();

      await firebaseFirestore.collection("users").doc(user!.uid).get().then(
            (value) => {
              setState(() {
                userModel = UserModel.fromMap(value.data());
              }),
            },
          );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var ids = prefs.getStringList('watchList');

      ids!.forEach((id) {
        savedMovies.add(homeViewViewModel.moviesList.data!
            .where((movie) => movie['id'] == id)
            .first);
      });

      length = ids.length;
    } on FirebaseAuthException catch (error) {
      print(error);
    }
  }
}
