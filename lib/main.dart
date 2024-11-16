import 'package:dice_roller/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Roller",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Dice Roller",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: const DiceRollerPage(),
      ),
    );
  }
}
