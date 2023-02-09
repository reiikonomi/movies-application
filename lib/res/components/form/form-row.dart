import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class FormRow extends StatelessWidget {
  const FormRow(
      {super.key,
      required this.rowText,
      required this.route,
      required this.rowButtonText});

  final String rowText;
  final String route;
  final String rowButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        rowText,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Text(
          rowButtonText,
          style: const TextStyle(
              color: AppColors.redColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      )
    ]);
  }
}
