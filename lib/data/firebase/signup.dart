import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_application/data/firebase/firebase-exceptions.dart';
import 'package:movies_application/models/user.model.dart';
import 'package:movies_application/utils/routes/routes-name.dart';

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
          .then((value) =>
              {postDetailsToFirestore(auth, firstName, lastName, context)})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      catchExceptions(error, errorMessage);
    }
  }
}

postDetailsToFirestore(auth, firstName, lastName, context) async {
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

  Navigator.of(context).pushNamed(RoutesName.home);
}
