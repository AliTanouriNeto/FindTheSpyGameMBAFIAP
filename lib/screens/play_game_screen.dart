import 'package:find_the_spy/components/app_bar.dart';
import 'package:flutter/material.dart';
class PlayGameScreen extends StatefulWidget {
  const PlayGameScreen({Key? key}) : super(key: key);
  static const String id = 'play_game_screen';

  @override
  State<PlayGameScreen> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
