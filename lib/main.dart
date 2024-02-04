import 'package:flutter/material.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      title: 'Calculator Made by Tunc',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
