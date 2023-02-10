import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_application/res/colors.dart';

void catchExceptions(FirebaseAuthException error, String? errorMessage) {
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
      errorMessage = "Authentication with email and password is not enabled.";
      break;
    default:
      errorMessage = "Something wrong happened.";
  }
  Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: AppColors.redColor,
      textColor: AppColors.whiteColor);
}
