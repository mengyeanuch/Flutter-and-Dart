import 'dart:math';
import 'package:flutter/material.dart';

const String dice2 = "../../assets/dices/dice-2.png";
const String dice4 = "../../assets/dices/dice-4.png";

String activeDice = dice2;

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  void rollDice() {
    setState(() {
      activeDice = dice4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(activeDice),
              SizedBox(height: 20),
              TextButton(
                onPressed: rollDice,
                child: Text(
                  "Click here to roll",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Dice()));
}
