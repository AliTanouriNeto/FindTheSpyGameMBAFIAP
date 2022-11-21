import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/app_bar.dart';
import '../constants/routes.dart';
import '../models/service_maps.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);
  static const String id = 'maps_screen';

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List<String> listStrings = <String>[];
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
                  'View Maps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  getMaps();
                },
              ),
              (listStrings.length == 0)
                  ? Text(
                      "\n\n"
                      "Não é legal ver os mapas possíveis antes de jogar!\n\n"
                      "Ainda assim quer ve-los?\n\n"
                      "Aperte o botão acima",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: listStrings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30,
                          child: Center(
                            child: Text(
                              listStrings[index],
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getMaps() async {
    Uri _url = Uri.https(Routes.realTimeBase, "/maps.json");
    return http.get(_url).then((response) {
      print(response.body);
      listStrings = [];
      Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        setState(() {
          listStrings.add(map[key]["map"]);
        });
      });
    });
  }
}
