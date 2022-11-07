import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: InkWell(
        onTap: () {Navigator.pushNamed(context,LoginScreen.id);},
        child: const Icon(
          Icons.fingerprint,
          size: 100,
          color: Colors.white70,
        ),
      ),
    );
  }
}
