import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/routes.dart';

class SignUpService {
  signUp(String email, String password) async {
    var uri = Uri.parse(Routes.urlSignUp);
    http.Response response = await http.post(
      uri,
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
  }
}
