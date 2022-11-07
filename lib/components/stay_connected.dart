import 'package:flutter/material.dart';
class StayConnected extends StatefulWidget {
  const StayConnected({Key? key}) : super(key: key);

  @override
  State<StayConnected> createState() => _StayConnectedState();
}

class _StayConnectedState extends State<StayConnected> {
  bool continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
        value: this.continueConnected,
        onChanged: (var newValue) {
          setState(() {
            this.continueConnected = newValue!;
            print(this.continueConnected);
          });
        },
      ),
      Text(
        'stay connected?',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],);
  }
}
