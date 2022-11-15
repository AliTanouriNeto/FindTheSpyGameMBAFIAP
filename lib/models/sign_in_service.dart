import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/routes.dart';

class SignInService {
  signIn(String email, String password) async {
    var uri = Uri.parse(Routes.urlSignIn);
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
    dynamic bodyJson = json.decode(response.body);
    if (response.statusCode == 400) {
      return {
        'sucesso': false,
        'mensagem': retornarMensagem(bodyJson['error']['message']),
        'idToken': null
      };
    } else {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', bodyJson['localId']);
      sharedPreferences.setString('displayName', bodyJson['displayName']);

      return {
        'sucesso': true,
        'mensagem': 'Login realizado com sucesso',
        'idToken': bodyJson['idToken']
      };
    }
  }

  String retornarMensagem(String respostaLogin){
    switch(respostaLogin)
    {
      case 'INVALID_EMAIL': return 'Informe um e-mail válido';
      case 'EMAIL_NOT_FOUND': return 'E-mail ou senha inválidos';
      case 'INVALID_PASSWORD': return 'E-mail ou senha inválidos';
      case 'MISSING_PASSWORD': return 'Informe a senha';
      default: return 'Erro ao realizar login';
    }
  }
}
