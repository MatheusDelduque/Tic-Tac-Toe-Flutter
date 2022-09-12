import 'package:flutter/cupertino.dart';

enum GameOverState {
  xWin,
  oWin,
  draw,
}

class Game {
  bool isCircle = false;
  ValueNotifier<List<String>> board =
      ValueNotifier(["", "", "", "", "", "", "", "", ""]);
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
  Function(GameOverState) onGameOver;

  Game(this.onGameOver);

  void play(int index) {
    if (board.value[index] == "") {
      List<String> newChoosinPosition = [...board.value];
      newChoosinPosition[index] = isCircle ? "O" : "X";
      board.value = newChoosinPosition;
    }

    isCircle = !isCircle;

    if (checkWinner(board.value[index])) {
      onGameOver(
          board.value[index] == "X" ? GameOverState.xWin : GameOverState.oWin);
    }

    if (isDraw()) {
      onGameOver(GameOverState.draw);
    }
  }

  bool isDraw() {
    return !board.value.any(
      (elemento) => elemento == "",
    );
  }

  void restartGame() {
    board.value = ["", "", "", "", "", "", "", "", ""];
    isCircle = false;
  }

  bool checkWinner(String player) {
    return winningCombinations.any(
      (combinations) => combinations
          .every((elemento) => board.value[elemento].contains(player)),
    );
  }
}
