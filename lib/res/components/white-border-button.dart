import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/style/text-style.dart';

class WhiteBorderButton extends StatelessWidget {
  const WhiteBorderButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.26,
      height: height * 0.055,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteColor, width: 2.0),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyle.instance.bodyXLarge,
          ),
        ],
      ),
    );
  }
}
