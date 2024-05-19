import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/providers/authentication_provider.dart';
import 'package:news/src/screens/authentication/widgets/password_field.dart';
import 'package:news/src/shared/strings.dart';
import 'package:news/src/shared/ui.dart';
import 'package:provider/provider.dart';
import 'package:triton_extensions/triton_extensions.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        context.pop();
                      }, icon: const Icon(Icons.close), style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.primary,
                        iconSize: 32
                      ),),
                      16.space,
                      const Icon(
                        FontAwesomeIcons.newspaper,
                        size: 72,
                      ),
                      16.space,
                      const Text(
                        signUpScreenWelcomeText,
                        style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      4.space,
                      const Text(
                        signUpScreenSubHeadingText,
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      16.space,
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return emailValidationText;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: emailFieldHintText),
                              ),
                              16.space,
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return passwordValidationText;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: passwordFieldHintText),
                              ),
                              16.space,
                              PasswordInputField(
                                hintText: confirmPasswordHintText,
                                controller: confirmPasswordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return confirmPasswordValidationText;
                                  }else if (val != passwordController.text){
                                    return confirmPasswordNotMatchText;
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
                                    signUpButtonText,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  16.space,
                                  IconButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        authProvider
                                            .signUp(emailController.text.trim(),
                                            passwordController.text.trim())
                                            .catchError((err) {
                                          showSnackBarMessage(context, err.toString());
                                        });
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
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(alreadyHaveAnAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
