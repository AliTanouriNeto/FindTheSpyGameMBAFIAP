import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/components/fingerprint_material.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

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
                height: 32,
                width: double.infinity,
              ),
              const Text(
                'put your finger to identify your registration',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              const FingerPrint(),
            ],
          ),
        ),
      ),
    );
  }
}