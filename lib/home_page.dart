import 'dart:async';

import 'package:brick_breaker/Ball.dart';
import 'package:brick_breaker/cover_screen.dart';
import 'package:brick_breaker/game_over_screen.dart';
import 'package:brick_breaker/player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Direction { up, down }

class _HomePageState extends State<HomePage> {
  double ballx = 0;
  double bally = 0;
  bool isGameOver = false;

  void startGame() {
    hasStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        //updateing direction
        updateDirection();
        // moving the ball
        moveBall();
        //check if the game is over
        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
          ballx = 0;
          bally = 0;
        }
      });
    });
  }

  bool isPlayerDead() {
    if (bally >= .99) {
      return true;
    }
    return false;
  }

  var direction = Direction.down;
  bool hasStarted = false;
  double playerx = 0;
  double playerWidth = 0.3;
  void updateDirection() {
    if (bally >= .9 && ballx >= playerx && ballx <= playerx + playerWidth) {
      direction = Direction.up;
    }
    if (bally <= -.9) direction = Direction.down;
  }

  void moveBall() {
    setState(() {
      if (direction == Direction.down)
        bally += 0.01;
      else
        bally -= 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        Move(details, context);
      },
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        body: Center(
          child: Stack(
            children: [
              // tap to start
              CoverScreen(hasStarted: hasStarted),
              // the ball
              Ball(ballx: ballx, bally: bally),
              // player
              Player(
                playerWidth: playerWidth,
                playerx: playerx,
              ),
              // Game Over
              GameOver(isGameover: isGameOver),

              Container(
                all
              )
            ],
          ),
        ),
      ),
    );
  }

  void Move(DragUpdateDetails details, BuildContext context) {
    return setState(() {
      if (-.99 < playerx && .99 > playerx + playerWidth)
        playerx += details.delta.dx / MediaQuery.of(context).size.width * 2;
      if (-.99 > playerx) playerx = -.98;
      if (.99 < playerx) playerx = .98;
      print(playerx);
    });
  }
}
