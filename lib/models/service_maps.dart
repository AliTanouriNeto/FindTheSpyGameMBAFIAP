import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/routes.dart';

class ServiceMaps {

  Future<void> getMaps() async {
    List<String> listStrings = <String>[];
    Uri _url = Uri.https(Routes.realTimeBase, "/maps.json");
    return http.get(_url).then((response) {
      print(response.body);
      listStrings = [];
      Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        listStrings.add(map[key]["map"]);
      });
    });
  }
}
