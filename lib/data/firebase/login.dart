import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_application/data/firebase/firebase-exceptions.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/view/home/home-screen.dart';

void signIn(
    BuildContext context,
    String email,
    String password,
    GlobalKey<FormState> formKey,
    FirebaseAuth auth,
    String? errorMessage) async {
  if (formKey.currentState!.validate()) {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "Logged in Successfully!",
                    backgroundColor: AppColors.redColor,
                    textColor: AppColors.whiteColor),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen())),
              });
    } on FirebaseAuthException catch (error) {
      catchExceptions(error, errorMessage);
    }
  }
}
