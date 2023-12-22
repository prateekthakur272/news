import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/screens/intro_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const IntroScreen(),
      theme: ThemeData(
        colorSchemeSeed: primaryColor
      ),
    );
  }
}
void main(List<String> args) {
  runApp(const App());
}