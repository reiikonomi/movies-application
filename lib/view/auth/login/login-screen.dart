import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_application/data/firebase/login.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/form/form-input.dart';
import 'package:movies_application/res/components/form/form-row.dart';
import 'package:movies_application/res/components/form/form-submit-button.dart';
import 'package:movies_application/utils/routes/routes-name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.redColor,
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () =>
                {Navigator.of(context).pushNamed(RoutesName.onboard)},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.redColor,
            )),
      ),
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.blackColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset("assets/login.svg"),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  FormInput(
                      formController: emailController,
                      formType: "Email",
                      inputAction: TextInputAction.next,
                      obscureText: false,
                      icon: const Icon(Icons.email),
                      regex: RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")),
                  const SizedBox(height: 25),
                  FormInput(
                      formController: passwordController,
                      formType: "Password",
                      obscureText: true,
                      icon: const Icon(Icons.vpn_key),
                      inputAction: TextInputAction.done,
                      regex: RegExp(r'^.{6,}$')),
                  const SizedBox(height: 25),
                  FormSubmitButton(
                      submit: () => signIn(
                          context,
                          emailController.text,
                          passwordController.text,
                          _formKey,
                          _auth,
                          errorMessage),
                      label: "Login"),
                  const SizedBox(height: 15),
                  const FormRow(
                      rowText: "New Here?",
                      route: RoutesName.signup,
                      rowButtonText: "Sign Up"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
