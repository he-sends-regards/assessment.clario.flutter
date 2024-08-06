import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SignUpButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(AppColors.buttonText),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 36)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 1.4,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.buttonBackgroundLinear,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 240, minHeight: 48),
          child: Text(text),
        ),
      ),
    );
  }
}
