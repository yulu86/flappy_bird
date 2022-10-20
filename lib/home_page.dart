import 'package:flappy_bird/bird.dart';
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
                    child: Bird(
                      birdY: _birdY,
                      onEnd: onJumpEnd,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/land.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('分数'),
                              Text('16'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('最高分'),
                              Text('128'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
      // _birdY = 1;
    });
  }
}
