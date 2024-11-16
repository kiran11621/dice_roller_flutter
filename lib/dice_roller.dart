import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  int diceNumber = 1;
  List<int> lastRolls = [];

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      if (lastRolls.length >= 8) {
        lastRolls.removeAt(0);
      }
      lastRolls.add(diceNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'assets/images/$diceNumber.png',
            width: 250,
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.black,
              ),
            ),
            onPressed: rollDice,
            child: Text(
              "Roll the Dice",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "History",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: lastRolls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/${lastRolls[index]}.png',
                  width: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
