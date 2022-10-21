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

class _HomePageState extends State<HomePage> {
  double _birdY = 0;
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
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
                        const Pipe(
                          pipeHeight: 200,
                          pipeX: 0.9,
                          pipeY: -1,
                        ),
                        const Pipe(
                          pipeHeight: 100,
                          pipeX: 0.9,
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
  }
}
