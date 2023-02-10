import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {super.key,
      required this.formController,
      required this.formType,
      required this.regex,
      required this.inputAction,
      required this.obscureText,
      required this.icon});

  final TextEditingController formController;
  final String formType;
  final RegExp regex;
  final TextInputAction inputAction;
  final bool obscureText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        controller: formController,
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return ("$formType is required!");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter a valid $formType");
          }
        },
        onSaved: (value) {
          formController.text = value!;
        },
        style: const TextStyle(color: AppColors.whiteColor),
        textInputAction: inputAction,
        decoration: InputDecoration(
          prefixIcon: icon,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: formType,
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
  }
}
