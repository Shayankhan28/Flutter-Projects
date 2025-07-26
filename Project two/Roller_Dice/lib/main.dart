import 'package:flutter/material.dart';
import 'gradient_cont.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 205, 188, 125),
                  const Color.fromARGB(255, 86, 107, 118),
                  // const Color.fromARGB(255, 115, 247, 183),
                ],
                begin: startAlginment,
                end: endAlginment,
              ),
            ),
          ),

          title: const Text(
            "Dice Roller",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          centerTitle: true,
        ),

        body: GradientContainer(
          const Color.fromARGB(255, 86, 107, 118),
          const Color.fromARGB(255, 205, 188, 125),
          const Color.fromARGB(255, 115, 247, 183),
        ),
      ),
    ),
  );
}
