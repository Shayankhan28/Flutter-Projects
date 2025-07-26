import 'package:chapt2/Signup_Screen.dart';
import 'package:chapt2/welcomescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool hidetext = true;

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xff203142),
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
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    hintText: "Email",
                    fillColor: Color(0xfff8f9fa),

                    filled: true,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xff323F4B),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: hidetext,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Color(0xfff8f9fa),
                    filled: true,
                    prefixIcon: Icon(Icons.lock, color: Color(0xff323F4B)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidetext ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xff323F4B),
                      ),
                      onPressed: () {
                        setState(() {
                          hidetext = !hidetext;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 200, top: 10),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: "Rubik Regular",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
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
                    String email = emailcontroller.text.trim();
                    String password = passwordcontroller.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Fill the box"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red.shade300,
                        ),
                      );
                      return;
                    }
                    if (!isValidEmail(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter a valid email"),
                          backgroundColor: Colors.red.shade300,
                        ),
                      );
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Welcomescreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontFamily: "Rubik Regular", fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Rubik Medium ",
                        fontSize: 16,
                        color: Color(0xfff9703b),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
