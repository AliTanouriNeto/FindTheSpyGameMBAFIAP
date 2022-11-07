import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/components/forms_sign_up.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = "sign_up_screen";

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  Color topColor = Colors.blueGrey;
  Color bottomColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [topColor, bottomColor]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon.png',
                height: 180,
                width: 180,
                color: Colors.black54,
              ),
              SizedBox(
                height: 12,
                width: double.infinity,
              ),
              Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              FormsSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
