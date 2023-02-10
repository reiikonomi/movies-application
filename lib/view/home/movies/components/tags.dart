import 'package:flutter/material.dart';
import 'package:movies_application/res/colors.dart';

class Tags extends StatelessWidget {
  final double width;
  final double height;
  final List<dynamic> data;
  const Tags(
      {super.key,
      required this.width,
      required this.height,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data[0].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.redColor,
                ),
                padding: const EdgeInsets.all(5),
                child: Text(data[0][index],
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor)),
              ),
            );
          }),
    );
  }
}
