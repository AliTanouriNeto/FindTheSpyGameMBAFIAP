import 'package:flutter/material.dart';

class Utilities {
  static void message(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 7),
      action: SnackBarAction(
        label: 'Dissmiss',
        textColor: Colors.white,
        onPressed: () {
          //ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
