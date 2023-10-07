import 'package:flutter/material.dart';
import 'package:flutter_calculator/services/Calculation.dart';
import '../components/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'History.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  List<Calculation> history = [];

// Array of button
  final List<String> buttons = [
    '%',
    '√',
    'x²',
    '1⁄x',
    'CE',
    'C',
    '+/-',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    setState(() {
      history.add(Calculation(userInput, answer));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculator"),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => History(items: history),
                ),
              );
            },
            child: const Icon(
              Icons.menu,
            ),
          )),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  answer,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (buttons[index] == 'C') {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }

                    // +/- button
                    else if (buttons[index] == '+/-') {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // % Button
                    else if (buttons[index] == '%') {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button
                    else if (buttons[index] == 'DEL') {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Equal_to Button
                    else if (buttons[index] == '=') {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }

                    // other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
