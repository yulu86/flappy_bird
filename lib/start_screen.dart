import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '点击开始游戏',
      style: TextStyle(
        fontSize: 64,
        color: Colors.green,
      ),
    );
  }
}
