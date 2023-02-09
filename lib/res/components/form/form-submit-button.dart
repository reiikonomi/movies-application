import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton(
      {super.key, required this.submit, required this.label});

  final VoidCallback submit;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: AppColors.redColor,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          elevation: 0,
          minWidth: MediaQuery.of(context).size.width,
          onPressed: submit,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold),
          )),
    );
    ;
  }
}
