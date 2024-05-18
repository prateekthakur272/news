import 'package:flutter/material.dart';
import 'package:news/src/screens/home_screen.dart';
import 'package:news/src/shared/strings.dart';
import 'package:news/src/shared/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const HomeScreen(),
      theme: themeLight
    );
  }
}
