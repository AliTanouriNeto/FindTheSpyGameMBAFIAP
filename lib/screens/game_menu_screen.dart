import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/screens/maps_screen.dart';
import 'package:find_the_spy/screens/play_game_screen.dart';
import 'package:find_the_spy/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';

import '../models/service_maps.dart';

class GameMenuScreen extends StatefulWidget {
  const GameMenuScreen({Key? key}) : super(key: key);
  static const String id = 'game_menu_screen';

  @override
  State<GameMenuScreen> createState() => _GameMenuScreenState();
}

class _GameMenuScreenState extends State<GameMenuScreen> {
  Color topColor = Colors.blueGrey;
  Color bottomColor = Colors.lightBlueAccent;

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
              ElevatedButton(
                child: Text(
                  'Play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PlayGameScreen.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              ElevatedButton(
                child: Text(
                  'Maps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                   Navigator.pushNamed(context, MapsScreen.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              ElevatedButton(
                child: Text(
                  'How To Play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, TutorialScreen.id);
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
}
