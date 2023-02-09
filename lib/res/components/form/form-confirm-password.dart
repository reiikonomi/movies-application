import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class FormConfirmPassword extends StatelessWidget {
  const FormConfirmPassword(
      {super.key,
      required this.confirmPasswordEditingController,
      required this.passwordEditingController});

  final TextEditingController confirmPasswordEditingController;
  final TextEditingController passwordEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password do not match!";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password!",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 2,
            ),
          ),
        ));
    ;
  }
}
