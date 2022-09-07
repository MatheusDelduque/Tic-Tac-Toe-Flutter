import 'package:bin2dec/components/cards.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(137, 5, 141, 107),
          title: const Text("Tic Tac Toe"),
        ),
        backgroundColor: const Color.fromARGB(255, 106, 119, 106),
        body: const CardButtons(),
      ),
    );
  }
}
