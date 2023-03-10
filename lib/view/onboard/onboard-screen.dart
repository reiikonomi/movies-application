import 'package:flutter/material.dart';
import 'package:movies_application/main.dart';
import 'package:movies_application/res/constants/string-constants.dart';
import 'package:movies_application/res/style/text-style.dart';
import 'package:movies_application/utils/routes/routes-name.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              AppString.instance.pathOnboardImage,
              fit: BoxFit.cover,
            ),
          ),
          _onboardBody(
            height,
            width,
            context,
          ),
        ],
      ),
    );
  }

  Widget _onboardBody(double height, double width, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(AppString.instance.textWelcome, style: AppStyle.instance.h2Bold),
        SizedBox(
          height: height * .4,
        ),
        SizedBox(
          height: height * .02,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesName.login);
            },
            child: SizedBox(
              width: width * .4,
              height: height * .065,
              child: Center(
                child: Text(AppString.instance.textGetStarted),
              ),
            )),
        SizedBox(
          height: height * .02,
        ),
      ],
    );
  }
}
