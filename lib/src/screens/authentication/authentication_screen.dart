import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/src/screens/authentication/widgets/signin_screen.dart';
import 'package:triton_extensions/triton_extensions.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: -100,
            child: Container(
              height: context.screenSize.height/4,
              width: context.screenSize.height/4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            right: -140,
            child: Container(
              height: context.screenSize.height/3,
              width: context.screenSize.height/3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.primary.withAlpha(150)
              ),
            ),
          ),
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),child: Container(),)
        ],
      ),
    );
  }
}
