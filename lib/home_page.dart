import 'dart:ffi';

import 'package:calculator/button.dart';
import 'package:calculator/function.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num result = 0;
  var input = '0';
  //function for check input
  void checkInput(int index) {
    if (sembol[index] != 'C' &&
        sembol[index] != 'ANS' &&
        sembol[index] != 'DEL') {
      if (input == '0') {
        input = '';
      }
      input += sembol[index];
    }
  }

  final List<String> sembol = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'ANS',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(input,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50))),
                )),
            Expanded(
              flex: 2,
              child: GridView.builder(
                padding: const EdgeInsets.all(1),
                itemCount: sembol.length,
                itemBuilder: (BuildContext context, index) {
                  return TextButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.black12),
                    onPressed: () {
                      setState(() {
                        checkInput(index);
                        switch (sembol[index]) {
                          case 'C':
                            input = '0';
                            break;
                          case 'DEL':
                            input = input.substring(0, input.length - 1);
                            if (input.isEmpty) {
                              input = '0';
                            }
                            break;
                          case '=':
                            result = Funct().Calculator(input);
                            input = result.toString();
                            break;
                        }
                      });
                    },
                    child: CalButton(
                      text: sembol[index],
                      color: Colors.black,
                      textStyle: TextStyle(
                          color: isOperating(sembol[index])
                              ? const Color.fromARGB(255, 151, 70, 4)
                              : const Color.fromARGB(255, 128, 127, 127),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isOperating(String x) {
  if (x == '+' ||
      x == '-' ||
      x == '/' ||
      x == '*' ||
      x == 'ANS' ||
      x == '%' ||
      x == '=' ||
      x == 'C' ||
      x == 'DEL') {
    return true;
  }
  return false;
}
