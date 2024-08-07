import 'package:flutter/material.dart';
import '../styles/colors.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isSubmitted;

  const PasswordInput({
    required Key key,
    required this.controller,
    required this.validator,
    this.isValid = true,
    this.isSubmitted = false,
  }) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isHidden,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: null,
        errorText: null,
        helperText: null,
        suffixText: null,
        hintText: "Create your password",
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: widget.isSubmitted
                  ? (widget.isValid
                      ? AppColors.inputIconValid
                      : AppColors.inputIconInvalid)
                  : AppColors.inputIconDefault,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: widget.isSubmitted
                  ? (widget.isValid
                      ? AppColors.inputBorderValid
                      : AppColors.inputBorderInvalid)
                  : Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.inputBorderInvalid),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.inputBorderInvalid),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.5, horizontal: 20),
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
