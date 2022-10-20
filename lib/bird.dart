import 'package:flutter/material.dart';

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
