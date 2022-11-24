import 'dart:async';

import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/models/sign_in_service.dart';
import 'package:find_the_spy/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'game_menu_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'menu_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      SignInService.isAuth(),
    ]).then((value) => value[0]
        ? Navigator.pushReplacementNamed(context, GameMenuScreen.id)
        : Navigator.pushReplacementNamed(context, LoginScreen.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey, Colors.lightBlueAccent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon.png',
                height: 300,
                width: 300,
                color: Colors.black54,
              ),
              const SizedBox(
                height: 5,
                width: double.infinity,
              ),
              const Text(
                'Welcome to the Central Intelligence Agency',
                style: TextStyle(color: Colors.white70, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
