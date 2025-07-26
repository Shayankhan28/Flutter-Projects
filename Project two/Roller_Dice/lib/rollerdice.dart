import 'dart:math';
import 'package:flutter/material.dart';

var randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentdiceroll = 2;
  void rolldice() {
    setState(() {
      currentdiceroll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) => RotationTransition(
            turns: animation,
            child: child,
          ),

          child: Image.asset(
            "assets/images/dice-$currentdiceroll.png",
            key: ValueKey(currentdiceroll),
            width: 250,
          ),
        ),
        const SizedBox(
          height: 25,
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 99, 27, 22),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 25),
          ),
          onPressed: rolldice,

          child: Text("Roller Dice"),
        ),
      ],
    );
  }
}
