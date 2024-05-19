import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController? controller;
  const PasswordInputField({super.key, this.validator, required this.hintText, this.controller});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hide,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(onPressed: (){
          setState(() {
            hide = !hide;
          });
        }, icon: Icon(hide?Icons.visibility:Icons.visibility_off),)
      ),
      validator: widget.validator,
    );
  }
}
