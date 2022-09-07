import 'package:flutter/material.dart';

class CardButtons extends StatefulWidget {
  const CardButtons({Key? key}) : super(key: key);

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  String playerX = "X";
  String playerO = "O";
  List<String> choosinPosition = ["", "", "", "", "", "", "", "", ""];
  List<List<int>> winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  bool isCircle = false;

  void changingPlayer(index) {
    setState(() {
      if (choosinPosition[index] == "" && isCircle == false) {
        choosinPosition[index] = "X";
      }

      if (choosinPosition[index] == "" && isCircle == true) {
        choosinPosition[index] = "O";
      }
      isCircle = !isCircle;
      if (checkWinner() == true) {
        finalText("X");
      }
    });
  }

  void restartGame() {
    setState(() {
      choosinPosition = ["", "", "", "", "", "", "", "", ""];
    });
  }

  void finalText(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("$winner is Winner!!!"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  restartGame();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  checkWinner() {
    winningCombinations.map(
      (combinations) => combinations
          .every((elemento) => choosinPosition[elemento].contains("X")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsetsDirectional.only(top: 70),
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  changingPlayer(index),
                },
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      choosinPosition[index],
                      style: const TextStyle(fontSize: 80),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
