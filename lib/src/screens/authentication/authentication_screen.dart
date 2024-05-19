import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/src/providers/authentication_provider.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/repositories/news_repository.dart';
import 'package:news/src/screens/authentication/widgets/signin_screen.dart';
import 'package:news/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(builder: (context, auth, child) {
      auth.listenUser();
      return auth.currentUser == null
          ? const SignInScreen()
          : ChangeNotifierProvider(
              create: (context) => NewsProvider(NewsRepository()),
              child: const HomeScreen());
    });
  }
}
