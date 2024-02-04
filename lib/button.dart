import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final String text;
  final color;
  final textStyle;
  const CalButton({super.key, required this.text, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Container(child: Center(child: Text(text, style: textStyle))),
      ),
    );
  }
}
