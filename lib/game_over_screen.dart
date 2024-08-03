import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final isGameover;
  const GameOver({super.key, this.isGameover});

  @override
  Widget build(BuildContext context) {
    return !isGameover?Container() :Container(
      alignment: Alignment(0, -0.3),
      child: Text(
        "G A M E O V E R !",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
