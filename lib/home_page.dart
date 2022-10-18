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
            ? Bird(
                birdY: _birdY,
                onEnd: onJumpEnd,
              )
            : GestureDetector(
                onTap: startGame,
                child: Container(
                  alignment: const Alignment(0, -0.2),
                  child: Container(
                    child: const Text(
                      '点击开始游戏',
                      style: TextStyle(
                        fontSize: 64,
                        color: Colors.green,
                      ),
                    ),
                  ),
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
    });
  }
}

class Bird extends StatelessWidget {
  const Bird({
    Key? key,
    required this.birdY,
    required this.onEnd,
  }) : super(key: key);

  final double birdY;
  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(-0.8, birdY),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
      onEnd: onEnd,
      child: Container(
        color: Colors.white,
        width: 40,
        height: 40,
        child: Image.asset('assets/images/bird0_0.png'),
      ),
    );
  }
}
