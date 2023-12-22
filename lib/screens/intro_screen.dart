import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: paddingAll24,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png',height: 180,),
              const Text('News, Articles and more, all at one place,\non your fingertips',style: TextStyle(color: onPrimaryColor, fontSize: 18,),textAlign: TextAlign.center,),
              space16,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.arrow_forward),),
    );
  }
}