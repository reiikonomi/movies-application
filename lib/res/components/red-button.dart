import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/style/text-style.dart';

class RedButton extends StatelessWidget {
  const RedButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.26,
      height: height * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.redColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_circle,
            color: AppColors.whiteColor,
            size: 25,
          ),
          SizedBox(
            width: width * .02,
          ),
          Text(
            "Watch",
            style: AppStyle.instance.bodyMedium,
          ),
        ],
      ),
    );
  }
}
