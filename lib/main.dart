import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
          colorSchemeSeed: primaryColor,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          appBarTheme: const AppBarTheme(
              surfaceTintColor: onPrimaryColor,
              titleTextStyle: TextStyle(
                color: onSurfaceColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}
