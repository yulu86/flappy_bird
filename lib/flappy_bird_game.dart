import 'package:flutter/material.dart';

class FlappyBirdGame extends StatefulWidget {
  const FlappyBirdGame({Key? key}) : super(key: key);

  @override
  State<FlappyBirdGame> createState() => _FlappyBirdGameState();
}

class _FlappyBirdGameState extends State<FlappyBirdGame> {
  double _birdY = 0.0;
  final String initBirdImage = 'assets/images/bird0_1.png';
  final String upBirdImage = 'assets/images/bird0_0.png';
  final String downBirdImage = 'assets/images/bird0_2.png';
  late String _birdImage = initBirdImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _moveUp,
      child: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment(-0.8, _birdY),
        duration: const Duration(milliseconds: 300),
        onEnd: _moveDown,
        curve: Curves.easeInOut,
        child: Image.asset(_birdImage),
      ),
    );
  }

  void _moveUp() {
    setState(() {
      _birdY -= 0.5;
      _birdImage = upBirdImage;
    });
  }

  void _moveDown() {
    setState(() {
      if (_birdY <= 0.5) {
        _birdY += 0.5;
        _birdImage = downBirdImage;
      }
    });
  }
}
