import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  String inputValue = "";
  String calculatorValue = "";
  String operator = "";

  Widget calc(String text, Color bgcolor) {
    double size = MediaQuery.of(context).size.width / 5;

    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: const EdgeInsets.all(10),
        height: size,
        width: size,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputValue = "";
            calculatorValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatorValue = inputValue;
            inputValue = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatorValue);
            double input = double.parse(inputValue);
            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(  // Wrapping the entire body in a scrollable widget
          child: Column(
            children: [
              // Input value with horizontal scroll to prevent overflow
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling for long input
                  child: Text(
                    inputValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
              // Using a Container to ensure space for buttons
              Container(
                // Adding padding to prevent the buttons from going off-screen
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calc("7", Colors.white54),
                        calc("8", Colors.white54),
                        calc("9", Colors.white54),
                        calc("/", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calc("4", Colors.white54),
                        calc("5", Colors.white54),
                        calc("6", Colors.white54),
                        calc("*", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calc("1", Colors.white54),
                        calc("2", Colors.white54),
                        calc("3", Colors.white54),
                        calc("-", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calc("0", Colors.white54),
                        calc(".", Colors.white54),
                        calc("=", Colors.orange),
                        calc("+", Colors.orange),
                      ],
                    ),
                    calc("clear", Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
