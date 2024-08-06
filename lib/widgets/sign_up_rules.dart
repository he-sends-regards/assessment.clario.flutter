import 'package:flutter/material.dart';
import '../styles/colors.dart';

class SignUpRules extends StatelessWidget {
  final bool isSubmitted;
  final bool characterCount;
  final bool upperCaseAndLowerCase;
  final bool oneDigit;

  const SignUpRules({
    Key? key,
    required this.isSubmitted,
    required this.characterCount,
    required this.upperCaseAndLowerCase,
    required this.oneDigit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 4,
      children: [
        RuleItem(
          isSubmitted: isSubmitted,
          isValid: characterCount,
          text: 'Password must be 8-64 characters long with no spaces',
        ),
        RuleItem(
          isSubmitted: isSubmitted,
          isValid: upperCaseAndLowerCase,
          text: 'Uppercase and lowercase letters',
        ),
        RuleItem(
          isSubmitted: isSubmitted,
          isValid: oneDigit,
          text: 'At least one digit',
        ),
      ],
    );
  }
}

class RuleItem extends StatelessWidget {
  final bool isSubmitted;
  final bool isValid;
  final String text;

  const RuleItem({
    Key? key,
    required this.isSubmitted,
    required this.isValid,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: isSubmitted
            ? (isValid ? AppColors.rulesValid : AppColors.rulesValid)
            : AppColors.commonText,
        fontSize: 13,
      ),
    );
  }
}
