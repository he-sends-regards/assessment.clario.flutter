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
        labelText: null,
        hintText: "Enter your email",
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.5, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: widget.isSubmitted
                  ? (widget.isValid
                      ? AppColors.inputBorderValid
                      : AppColors.inputBorderInvalid)
                  : Colors.transparent),
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
          borderSide: BorderSide(
              color: (widget.isValid
                  ? AppColors.inputBorderValid
                  : AppColors.inputBorderInvalid)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: (widget.isValid
                  ? AppColors.inputBorderValid
                  : AppColors.inputBorderInvalid)),
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
