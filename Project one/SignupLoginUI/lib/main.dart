import 'package:chapt2/Registration_screen.dart';
import 'package:chapt2/Signup_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: RegistrationScreen(),
    );
  }
}
