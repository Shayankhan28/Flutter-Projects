import 'package:chapt2/Login_screen.dart';
import 'package:chapt2/Signup_Screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 50,
                    width: 50,
                    image: AssetImage("image/logo.png"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MechMate",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Rubik Medium",
                          color: Color(0xff203142),
                        ),
                      ),
                      Text(
                        "Box",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Rubik Medium",
                          color: Color(0xfff9703b),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "Welcome to MechMate",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Rubik Medium",
                      color: Color(0xff203142),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. ",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Rubik Regular",

                    color: Color(0xff4C5980),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 100),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 237, 237),
                  shape: BoxShape.rectangle,

                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xfff9703b), width: 2),
                ),
                child: TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik Regular",
                      color: Color(0xfff9703b),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),

              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xfff9703b),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik Regular",
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
