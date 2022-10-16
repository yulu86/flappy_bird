import 'package:flutter/material.dart';

class FlappyBirdGame extends StatefulWidget {
  const FlappyBirdGame({Key? key}) : super(key: key);

  @override
  State<FlappyBirdGame> createState() => _FlappyBirdGameState();
}

class _FlappyBirdGameState extends State<FlappyBirdGame> {
  final double _step = 0.5;
  double _birdY = 0.0;
  final String initBirdImage = 'assets/images/bird0_1.png';
  final String upBirdImage = 'assets/images/bird0_0.png';
  final String downBirdImage = 'assets/images/bird0_2.png';
  late String _birdImage = initBirdImage;
  late Curve curve = Curves.bounceInOut;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _moveUp,
      child: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green[300],
        alignment: Alignment(-0.7, _birdY),
        duration: const Duration(milliseconds: 300),
        onEnd: _moveDown,
        curve: curve,
        child: Image.asset(_birdImage),
      ),
    );
  }

  void _moveUp() {
    setState(() {
      if (_birdY - _step >= -1) {
        _birdY -= _step;
      }
      _birdImage = upBirdImage;
      curve = Curves.bounceInOut;
    });
  }

  void _moveDown() {
    setState(() {
      // if (_birdY + _step <= 1) {
      //   _birdY += _step;
      // }
      _birdY = 1;
      _birdImage = downBirdImage;
      // curve = Curves.easeInToLinear;
    });
  }
}
