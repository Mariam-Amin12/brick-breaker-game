
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  const Ball({
    super.key,
    required this.ballx,
    required this.bally,
  });

  final double ballx;
  final double bally;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballx, bally),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            color: Colors.deepOrange, shape: BoxShape.circle),
      ),
    );
  }
}
