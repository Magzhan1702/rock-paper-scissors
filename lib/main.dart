import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SuLiFaGame(),
    );
  }
}

class SuLiFaGame extends StatefulWidget {
  const SuLiFaGame({super.key});

  @override
  State<SuLiFaGame> createState() => _SuLiFaGameState();
}

class _SuLiFaGameState extends State<SuLiFaGame> {
  final List<String> choices = ['✊', '✌️', '✋'];

  String playerChoice = '❓';
  String computerChoice = '❓';
  String result = 'Таңдауыңды жаса!';

  int playerScore = 0;
  int computerScore = 0;

  void playGame(String player) {
    Random random = Random();

    String computer = choices[random.nextInt(3)];

    String gameResult;

    if (player == computer) {
      gameResult = 'Тең! 🤝';
    } else if (
        (player == '✊' && computer == '✌️') ||
        (player == '✌️' && computer == '✋') ||
        (player == '✋' && computer == '✊')) {
      gameResult = 'Сен жеңдің! 🎉';
      playerScore++;
    } else {
      gameResult = 'Компьютер жеңді! 😢';
      computerScore++;
    }

    setState(() {
      playerChoice = player;
      computerChoice = computer;
      result = gameResult;
    });
  }

  void restartGame() {
    setState(() {
      playerChoice = '❓';
      computerChoice = '❓';
      result = 'Таңдауыңды жаса!';
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],

      appBar: AppBar(
        title: const Text(
          'Су-ли-фа',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'СУ-ЛИ-ФА 🎮',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    const Text(
                      'Сен',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      playerChoice,
                      style: const TextStyle(fontSize: 70),
                    ),
                  ],
                ),

                const Text(
                  'VS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Column(
                  children: [
                    const Text(
                      'Компьютер',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      computerChoice,
                      style: const TextStyle(fontSize: 70),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              result,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Сен $playerScore : $computerScore Компьютер',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                gameButton('✊'),

                gameButton('✌️'),

                gameButton('✋'),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: restartGame,
              icon: const Icon(Icons.refresh),
              label: const Text('Қайта бастау'),
            ),
          ],
        ),
      ),
    );
  }

  Widget gameButton(String choice) {
    return ElevatedButton(
      onPressed: () {
        playGame(choice);
      },

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
      ),

      child: Text(
        choice,
        style: const TextStyle(fontSize: 45),
      ),
    );
  }
}