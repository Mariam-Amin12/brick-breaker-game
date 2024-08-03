import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key, this.playerx, this.playerWidth});

  final  playerx;
  final  playerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2*playerx+playerWidth)/(2-playerWidth),0.9),
      child: Container(
        width: MediaQuery.of(context).size.width*playerWidth/2,
        height: 10,
        decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
