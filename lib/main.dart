import 'package:bin2dec/components/display.dart';
import 'package:flutter/material.dart';
import 'components/display.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Display(),
    );
  }
}
