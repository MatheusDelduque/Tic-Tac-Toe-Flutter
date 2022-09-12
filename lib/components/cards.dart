import 'package:bin2dec/game.dart';
import 'package:flutter/material.dart';

class CardButtons extends StatefulWidget {
  const CardButtons({Key? key}) : super(key: key);

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  late Game game;

  @override
  void initState() {
    super.initState();
    game = Game(onGameOver);
  }

  void onGameOver(GameOverState state) {
    switch (state) {
      case GameOverState.xWin:
        showFinalText("X is winner");
        break;

      case GameOverState.oWin:
        showFinalText("O is winner");
        break;

      default:
        showFinalText("Draw");
    }
  }

  void showFinalText(String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              child: const Text("Play Again"),
              onPressed: () {
                game.restartGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
                  game.play(index),
                },
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: ValueListenableBuilder<List<String>>(
                      valueListenable: game.board,
                      builder: (context, value, child) {
                        return Text(
                          value[index],
                          style: const TextStyle(fontSize: 80),
                        );
                      },
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
