import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_application/models/user.model.dart';

void signUp(
    BuildContext context,
    String email,
    String password,
    String firstName,
    String lastName,
    GlobalKey<FormState> formKey,
    FirebaseAuth auth,
    String? errorMessage) async {
  if (formKey.currentState!.validate()) {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(auth, firstName, lastName)})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Adresa juaj e emailit duket të jetë e keqformuar.";
          break;
        case "wrong-password":
          errorMessage = "Fjalëkalimi juaj është i gabuar.";
          break;
        case "user-not-found":
          errorMessage = "Përdoruesi me këtë email nuk ekziston.";
          break;
        case "user-disabled":
          errorMessage = "Përdoruesi me këtë email është çaktivizuar.";
          break;
        case "too-many-requests":
          errorMessage = "Shumë kërkesa ne server.";
          break;
        case "operation-not-allowed":
          errorMessage =
              "Identifikimi me email dhe fjalëkalim nuk është i aktivizuar.";
          break;
        default:
          errorMessage = "Ndodhi një gabim i papërcaktuar.";
      }
      Fluttertoast.showToast(
          msg: errorMessage!,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white);
    }
  }
}

postDetailsToFirestore(auth, firstName, lastName) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;

  UserModel userModel = UserModel();
  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.firstName = firstName;
  userModel.secondName = lastName;

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(
      msg: "Adresa u krijua me sukses :) ",
      backgroundColor: Colors.deepOrange,
      textColor: Colors.white);

  // Navigator.pushAndRemoveUntil(
  //     (context),
  //     MaterialPageRoute(builder: (context) => const NavBar()),
  //     (route) => false);
}
