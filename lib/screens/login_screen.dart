import 'dart:convert';

import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/components/forgot_password.dart';
import 'package:find_the_spy/components/stay_connected.dart';
import 'package:find_the_spy/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../values/preferences_keys.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color topColor = Colors.blueGrey;
  Color bottomColor = Colors.lightBlueAccent;
  double elevation = 30;
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  String mailInput = "";
  String passInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Image.asset(
                "assets/icon.png",
                color: Colors.black54,
                height: 150,
              ),
              SizedBox(
                height: 32,
                width: double.infinity,
              ),
              Text(
                "Join",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mailInputController,
                      decoration: InputDecoration(
                        labelText: 'E-Mail',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 12)),
              ForgotPassword(),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
              ),
              StayConnected(),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
              ),
              ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  doLogin();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  color: Colors.black54,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> doLogin() async {
    String mailform = _mailInputController.text;
    String passForm = _passwordInputController.text;
    User savedUser = await getSavedUser();
    if (mailform == savedUser.mail && passForm == savedUser.password) {
      print("LOGIN EFETUADO COM SUCESSO!!!");
    } else {
      print("FALHA NO LOGIN!!!");
    }
  }

  Future<User> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    User user = User.fromJson(mapUser);
    return user;
  }
}
