import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class SignInWithButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  const SignInWithButton({super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: context.colorScheme.primary,
      child: Container(
        padding: 12.padding,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.onSurface),
          borderRadius: BorderRadius.circular(16)
        ),
        child: icon,
      ),
    );
  }
}
