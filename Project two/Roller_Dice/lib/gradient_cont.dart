import 'package:apps/rollerdice.dart';
// import 'package:apps/textstyle.dart';
import 'package:flutter/material.dart';

final startAlginment = Alignment.topLeft;
final endAlginment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.color1,
    this.color2,
    this.color3, {
    super.key,
  });
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3],
          begin: startAlginment,
          end: endAlginment,
        ),
      ),
      child: Center(
        // child: StyleText("Made by shayan"),
        child: DiceRoller(),
      ),
    );
  }
}

// First appraoch to add color as constructor
