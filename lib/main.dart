
import 'package:find_the_spy/screens/game_menu_screen.dart';
import 'package:find_the_spy/screens/maps_screen.dart';
import 'package:find_the_spy/screens/play_game_screen.dart';
import 'package:find_the_spy/screens/tutorial_screen.dart';
import 'package:find_the_spy/screens/login_screen.dart';
import 'package:find_the_spy/screens/splash_screen.dart';
import 'package:find_the_spy/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
// @dart=2.9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Find The Spy',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          TutorialScreen.id: (context) => const TutorialScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          GameMenuScreen.id: (context) => const GameMenuScreen(),
          MapsScreen.id: (context) => const MapsScreen(),
          PlayGameScreen.id: (context) => const PlayGameScreen(),
        },
    );
  }
}