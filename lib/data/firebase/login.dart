// login function
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                    backgroundColor: Colors.deepOrange,
                    textColor: Colors.white),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen())),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Invalid email address.";

          break;
        case "wrong-password":
          errorMessage = "Invalid password.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many server requests. Try again later.";
          break;
        case "operation-not-allowed":
          errorMessage =
              "Authentication with email and password is not enabled.";
          break;
        default:
          errorMessage = "Something wrong happened.";
      }
      Fluttertoast.showToast(
          msg: errorMessage!,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white);
    }
  }
}
