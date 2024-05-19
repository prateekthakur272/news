import 'package:flutter/material.dart';
import 'package:news/src/navigation/router.dart';
import 'package:news/src/providers/authentication_provider.dart';
import 'package:news/src/providers/theme_provider.dart';
import 'package:news/src/repositories/authentication_repository.dart';
import 'package:news/src/shared/strings.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider(AuthenticationRepository()))
      ],
      child: Builder(
        builder: (context) {
          final router = AppRouter();
          return MaterialApp.router(
            title: title,
            routerConfig: router.router,
            theme: Provider.of<ThemeProvider>(context).theme
          );
        }
      ),
    );
  }
}
