import 'dart:convert';
import 'dart:math';

import 'package:find_the_spy/components/app_bar.dart';
import 'package:find_the_spy/components/utilities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/routes.dart';

class PlayGameScreen extends StatefulWidget {
  const PlayGameScreen({Key? key}) : super(key: key);
  static const String id = 'play_game_screen';

  @override
  State<PlayGameScreen> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGameScreen> {
  Color topColor = Colors.blueGrey;
  Color bottomColor = Colors.lightBlueAccent;
  int numberPlayers = 1;
  int numberSpys = 1;
  List<String> listStrings = <String>["Player: 1"];
  List<TextEditingController> _controllers = [];
  List<String> listMaps = <String>[];
  List<String> listFunctions = <String>[];
  late String mapChosen;
  bool listViewControl = false;

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
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50)),
              Image.asset(
                "assets/icon.png",
                color: Colors.black54,
                height: 150,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Player',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    numberPlayers.toString(),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        if (numberPlayers < 12) {
                          numberPlayers = numberPlayers + 1;
                          listStrings.add("Player: $numberPlayers");
                        } else {
                          Utilities.message(context, "Máximo de 12 Jogadores");
                        }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        if (numberPlayers <= 1) {
                          numberPlayers = 1;
                        } else {
                          listStrings.remove("Player: $numberPlayers");
                          numberPlayers = numberPlayers - 1;
                        }
                      });
                    },
                    child: Icon(Icons.exposure_minus_1_outlined),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Spy     ',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    numberSpys.toString(),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        if (numberSpys < 3) {
                          numberSpys = numberSpys + 1;
                        }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        if (numberSpys <= 1) {
                          numberSpys = 1;
                        } else {
                          numberSpys = numberSpys - 1;
                        }
                      });
                    },
                    child: Icon(Icons.exposure_minus_1_outlined),
                  ),
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listStrings.length,
                itemBuilder: (BuildContext context, int index) {
                  _controllers.add(new TextEditingController());
                  return Container(
                    height: 30,
                    child: Center(
                      child: (listViewControl)
                          ? TextFormField(
                              onChanged: (myController) {
                                setState(() {
                                  listStrings[index] = _controllers[index].text;
                                });
                              },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: listStrings[index],
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              child: Text(listStrings[index]),
                            ),
                    ),
                  );
                },
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              (listViewControl)
                  ? ElevatedButton(
                      child: Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        await getMaps();
                        mapChosen = choseMap();
                        await playersFunctions(mapChosen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(51)),
                      ),
                    )
                  : ElevatedButton(
                      child: Text(
                        'Finalizar Partida',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          listViewControl = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(51)),
                      ),
                    ),
              Padding(padding: EdgeInsets.all(16.0)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getMaps() async {
    Uri _url = Uri.https(Routes.realTimeBase, "/maps.json");
    return http.get(_url).then((response) {
      listMaps = [];
      Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        setState(() {
          listMaps.add(map[key]["map"]);
        });
      });
    });
  }

  String choseMap() {
    var rng = Random();
    int randomNumber = rng.nextInt(listMaps.length);
    String chosenMap = listMaps[randomNumber];
    playersFunctions(chosenMap);
    return chosenMap;
  }

  Future<void> playersFunctions(String chosenMap) async {
    Uri _url = Uri.https(Routes.realTimeBase, "/functions/map.json");
    return http.get(_url).then((response) {
      listFunctions = [];
      Map<String, dynamic> function = json.decode(response.body);
      function.forEach((key, value) {
        setState(() {
          listFunctions.add(function[key]["Airplane"]);
          print(function);
        });
      });
    });
  }
}
