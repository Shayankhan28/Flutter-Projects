import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 43,
        fontStyle: FontStyle.italic,

        color: Color.fromARGB(255, 172, 131, 6),
      ),
    );
  }
}
