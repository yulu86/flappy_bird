import 'dart:async';

import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/pipe.dart';
import 'package:flappy_bird/score_board.dart';
import 'package:flappy_bird/start_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const double gapSize = 0.5;

class _HomePageState extends State<HomePage> {
  double _birdY = 0;
  bool _isRunning = false;
  double pipeSize = 200;
  double pipeOneX = 0.9;
  double pipeTwoX = 1.6;
  double gapOneCenter = 0.2;
  double gapTwoCenter = 0;
  bool isCrash = false;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 3 / 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flappy Bird'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _birdY -= 0.5;
          });
        },
        child: _isRunning
            ? Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Pipe(
                          pipeHeight: maxHeight * (gapOneCenter - 0.25 + 1) / 2,
                          pipeX: pipeOneX,
                          pipeY: -1,
                        ),
                        Pipe(
                          pipeHeight:
                              maxHeight * (1 - (gapOneCenter + 0.25)) / 2,
                          pipeX: pipeOneX,
                          pipeY: 1,
                        ),
                        Pipe(
                          pipeHeight: maxHeight * (gapTwoCenter - 0.25 + 1) / 2,
                          pipeX: pipeTwoX,
                          pipeY: -1,
                        ),
                        Pipe(
                          pipeHeight:
                              maxHeight * (1 - (gapTwoCenter + 0.25)) / 2,
                          pipeX: pipeTwoX,
                          pipeY: 1,
                        ),
                        Bird(
                          birdY: _birdY,
                          onEnd: onJumpEnd,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: ScoreBoard(),
                  ),
                ],
              )
            : GestureDetector(
                onTap: startGame,
                child: Container(
                  alignment: const Alignment(0, -0.2),
                  child: const StartScreen(),
                ),
              ),
      ),
    );
  }

  void onJumpEnd() {
    setState(() {
      _birdY = 1;
    });
  }

  void startGame() {
    setState(() {
      _isRunning = true;
      // _birdY = 1;
    });

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      const double step = 0.02;
      final double newPipeOneX = pipeOneX - step;
      final double newPipeTwoX = pipeTwoX - step;

      isCrash = checkCrash(newPipeOneX, gapOneCenter) ||
          checkCrash(newPipeTwoX, gapTwoCenter);
      if (isCrash == true) {
        setState(() {
          _isRunning = false;
        });
        timer.cancel();
      } else {
        setState(() {
          pipeOneX = newPipeOneX < -1 ? 1.1 : newPipeOneX;
          pipeTwoX = newPipeTwoX < -1 ? 1.1 : newPipeTwoX;
        });
      }
    });
  }

  bool checkCrash(double pipeX, double gapCenter) {
    if (pipeX <= -0.75) {
      if ((_birdY > (gapCenter + 0.25)) || (_birdY < (gapCenter - 0.25))) {
        return true;
      }
    }
    return false;
  }
}
