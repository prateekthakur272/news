import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/screens/authentication/widgets/password_field.dart';
import 'package:news/src/screens/authentication/widgets/sign_in_with_button.dart';
import 'package:news/src/shared/strings.dart';
import 'package:triton_extensions/triton_extensions.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: -100,
            child: Container(
              height: context.screenSize.height / 4,
              width: context.screenSize.height / 4,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.primary.withAlpha(180)),
            ),
          ),
          Positioned(
            bottom: 200,
            right: -140,
            child: Container(
              height: context.screenSize.height / 3,
              width: context.screenSize.height / 3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.primary.withAlpha(100)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          SafeArea(
              child: Padding(
            padding: 16.padding,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      FontAwesomeIcons.newspaper,
                      size: 72,
                    ),
                    16.space,
                    const Text(
                      welcomeText,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    4.space,
                    const Text(
                      intro,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    16.space,
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val){
                                if(val!.isEmpty){
                                  return emailValidationText;
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: emailFieldHintText),
                            ),
                            16.space,
                            PasswordInputField(
                              hintText: passwordFieldHintText,
                              controller: passwordController,
                              validator: (val){
                                if(val!.isEmpty){
                                  return passwordValidationText;
                                }
                                return null;
                              },
                            ),
                            16.space,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  signInButtonText,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                16.space,
                                IconButton(
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){

                                    }
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                  style: IconButton.styleFrom(
                                      backgroundColor:
                                          context.colorScheme.primary,
                                      iconSize: 32),
                                ),
                                8.space,
                              ],
                            )
                          ],
                        )),
                    Center(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(forgotPasswordButtonText))),
                    16.space,
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        4.space,
                        Center(
                            child: Text(
                          orContinueWith,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600),
                        )),
                        4.space,
                        const Expanded(child: Divider())
                      ],
                    ),
                    16.space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInWithButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              size: 32,
                            )),
                        16.space,
                        SignInWithButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.github,
                              size: 32,
                            ))
                      ],
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(createAccountButtonText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
