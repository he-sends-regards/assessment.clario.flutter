import 'package:flutter/material.dart';
import '../styles/colors.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isSubmitted;

  const EmailInput({
    required Key key,
    required this.controller,
    this.validator,
    this.isValid = true,
    this.isSubmitted = false,
  }) : super(key: key);

  @override
  EmailInputState createState() => EmailInputState();
}

class EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 14.5, 45, 14.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.isSubmitted
                ? (widget.isValid
                    ? AppColors.inputBorderValid
                    : AppColors.inputBorderInvalid)
                : AppColors.inputBorderFocus,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.inputBorderInvalid),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.inputBorderInvalid),
        ),
      ),
      style: TextStyle(
        color: widget.isSubmitted
            ? (widget.isValid
                ? AppColors.inputTextValid
                : AppColors.inputTextInvalid)
            : AppColors.inputTextDefault,
        fontSize: 16,
      ),
      validator: widget.validator,
    );
  }
}
