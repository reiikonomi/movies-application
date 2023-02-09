import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/data/firebase/signup.dart';
import 'package:movies_application/res/colors.dart';
import 'package:movies_application/res/components/form/form-confirm-password.dart';
import 'package:movies_application/res/components/form/form-input.dart';
import 'package:movies_application/res/components/form/form-row.dart';
import 'package:movies_application/res/components/form/form-submit-button.dart';
import 'package:movies_application/utils/routes/routes-name.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.redColor),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesName.login);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.blackColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FormInput(
                          formController: firstNameEditingController,
                          formType: "First Name",
                          regex: RegExp(r'^.{3,}$'),
                          inputAction: TextInputAction.next,
                          obscureText: false,
                          icon: const Icon(Icons.account_circle)),
                      const SizedBox(height: 20),
                      FormInput(
                          formController: secondNameEditingController,
                          formType: "Last Name",
                          regex: RegExp(r'^.{3,}$'),
                          inputAction: TextInputAction.next,
                          obscureText: false,
                          icon: const Icon(Icons.account_circle)),
                      const SizedBox(height: 20),
                      FormInput(
                          formController: emailEditingController,
                          formType: "Email",
                          regex:
                              RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"),
                          inputAction: TextInputAction.next,
                          obscureText: false,
                          icon: const Icon(Icons.email)),
                      const SizedBox(height: 20),
                      FormInput(
                          formController: passwordEditingController,
                          formType: "Password",
                          regex: RegExp(r'^.{6,}$'),
                          inputAction: TextInputAction.next,
                          obscureText: true,
                          icon: const Icon(Icons.vpn_key)),
                      const SizedBox(height: 20),
                      FormConfirmPassword(
                          confirmPasswordEditingController:
                              confirmPasswordEditingController,
                          passwordEditingController: passwordEditingController),
                      const SizedBox(height: 20),
                      FormSubmitButton(
                          submit: () => signUp(
                              context,
                              emailEditingController.text,
                              passwordEditingController.text,
                              firstNameEditingController.text,
                              secondNameEditingController.text,
                              _formKey,
                              _auth,
                              errorMessage),
                          label: "Sign Up"),
                      const SizedBox(height: 15),
                      const FormRow(
                          rowText: "Already have an account?",
                          route: RoutesName.login,
                          rowButtonText: "Login"),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
