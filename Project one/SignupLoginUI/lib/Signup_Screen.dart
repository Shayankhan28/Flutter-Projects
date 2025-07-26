import 'package:chapt2/Login_screen.dart';
import 'package:chapt2/welcomescreen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;

  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController emailsignup = TextEditingController();
  TextEditingController passwordsign = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("image/logo.png", height: 50, width: 50),
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
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xff203142),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                style: TextStyle(
                  fontFamily: "Rubik Regular",
                  fontSize: 16,
                  color: Color(0xff4C5980),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 5,
                ),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Name",
                    fillColor: Color(0xfff8f9fa),
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 5,
                ),
                child: TextField(
                  controller: contact,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Contact",
                    fillColor: Color(0xfff8f9fa),
                    filled: true,
                    prefixIcon: Icon(Icons.phone),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 5,
                ),
                child: TextField(
                  controller: emailsignup,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Color(0xfff8f9fa),
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: passwordsign,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Color(0xfff8f9fa),
                    filled: true,
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Color(0xffe4e7eb)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xfff9703b),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik Regular",
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    String emails = emailsignup.text.trim();
                    String password = passwordsign.text.trim();
                    String number = contact.text.trim();
                    String names = name.text.trim();

                    if (emails.isEmpty ||
                        password.isEmpty ||
                        number.isEmpty ||
                        names.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Fill the box"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red.shade300,
                        ),
                      );
                      return;
                    }
                    if (!isValidEmail(emails)) {
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
              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontFamily: "Rubik Regular", fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Color(0xfff9703b), fontSize: 16),
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
