import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdY = 0;

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
            birdY -= 0.5;
          });
        },
        child: Bird(
          birdY: birdY,
          onEnd: onJumpEnd,
        ),
      ),
    );
  }

  void onJumpEnd() {
    setState(() {
      birdY = 1;
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
