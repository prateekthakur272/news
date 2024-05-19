import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/navigation/routes.dart';
import 'package:news/src/screens/authentication/authentication_screen.dart';
import 'package:news/src/screens/authentication/widgets/signup_screen.dart';
import 'package:provider/provider.dart';
import '../providers/authentication_provider.dart';

class AppRouter {
  GoRouter get router => _router;
  final _router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            name: Routes.home.name,
            pageBuilder: (context, state) => const MaterialPage(
                child: AuthenticationScreen())),
        GoRoute(
            path: '/sign-up',
            name: Routes.signUp.name,
            pageBuilder: (context, state) =>
                const MaterialPage(child: SignUpScreen()))
      ],
      redirect: (context, state) {
        final provider =
            Provider.of<AuthenticationProvider>(context, listen: false);
        provider.listenUser();
        if (provider.currentUser == null) {
          return '/';
        }
        return null;
      });
}
