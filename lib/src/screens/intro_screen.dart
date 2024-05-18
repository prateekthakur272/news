import 'dart:js';

import 'package:flutter/material.dart';
import 'package:news/src/shared/strings.dart';
import 'package:triton_extensions/triton_extensions.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Padding(
        padding: 24.padding,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png',height: 180,),
              Text(intro ,style: TextStyle(color: context.colorScheme.onPrimary, fontSize: 18,),textAlign: TextAlign.center,),
              16.space,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.arrow_forward),),
    );
  }
}