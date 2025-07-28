import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController agecontroller = TextEditingController();
  TextEditingController idcardcontroller = TextEditingController();
  String result = "";

  void Eligibility() {
    int age = int.parse(agecontroller.text.toLowerCase().trim());
    String idcard = idcardcontroller.text.toLowerCase().trim();
    if (age >= 18 && idcard == "yes".toLowerCase().trim()) {
      setState(() {
        result = "You are eligibile to vote ";
      });
    } else {
      setState(() {
        result = "Sorry! You are not eligible to vote";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Vote Eligibility"),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to the \nVote Checker",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 54, 51, 51),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Textfiledform(
                      hinttext: "Enter your age",
                      datatyype: agecontroller,
                    ),
                    SizedBox(height: 30),
                    Textfiledform(
                      hinttext: "Do you have an ID-Card (yes/no)",
                      datatyype: idcardcontroller,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        String cardia = idcardcontroller.text
                            .toLowerCase()
                            .trim();
                        String ageia = agecontroller.text.trim();

                        if (cardia.isEmpty || ageia.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please fill in all fields."),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        int? age = int.tryParse(ageia);
                        if (age == null ||
                            (cardia != "yes" && cardia != "no")) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please enter a valid age and either 'yes' or 'no' for ID card.",
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        // If validation passes
                        Eligibility();
                      },
                      child: Text("Check result"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Textfiledform extends StatelessWidget {
  const Textfiledform({
    super.key,
    required this.hinttext,
    required this.datatyype,
  });
  final String hinttext;
  final TextEditingController? datatyype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: datatyype,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 238, 236, 236),
          filled: true,
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 190, 190, 190),
            ),
          ),
        ),
      ),
    );
  }
}
