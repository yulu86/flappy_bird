import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  const Pipe({
    Key? key,
    required this.pipeX,
    required this.pipeY,
    required this.pipeHeight,
  }) : super(key: key);

  final double pipeX;
  final double pipeY;
  final double pipeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(pipeX, pipeY),
      child: Container(
        width: 60,
        height: pipeHeight,
        color: Colors.green,
      ),
    );
  }
}
