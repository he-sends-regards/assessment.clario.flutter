import 'package:clario_assessment_flutter/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clario_assessment_flutter/widgets/sign_up_button.dart';
import 'package:clario_assessment_flutter/widgets/Headline.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';
import '../widgets/sign_up_rules.dart';

class ValidationRegexps {
  static final emailRegex = RegExp(r'\S+@\S+\.\S+');
  static final passwordLengthRegex = RegExp(r'^.{8,64}$');
  static final digitRegex = RegExp(r'\d');
  static final lowerCaseRegex = RegExp(r'[a-z]');
  static final upperCaseRegex = RegExp(r'[A-Z]');
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSubmitted = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  String? _emailValidator(String? value) {
    _isEmailValid = !(value == null ||
        value.isEmpty ||
        !ValidationRegexps.emailRegex.hasMatch(value));
    return null;
  }

  String? _passwordValidator(String? value) {
    _isPasswordValid = !(value == null ||
        value.isEmpty ||
        !ValidationRegexps.passwordLengthRegex.hasMatch(value) ||
        !ValidationRegexps.digitRegex.hasMatch(value) ||
        !ValidationRegexps.lowerCaseRegex.hasMatch(value) ||
        !ValidationRegexps.upperCaseRegex.hasMatch(value) ||
        value.contains(' '));
    return null;
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: AppColors.toastText,
        ),
      ),
      backgroundColor: AppColors.toastBackground,
      duration: const Duration(seconds: 2),
    ));
  }

  void _submitForm() {
    setState(() {
      _isSubmitted = true;
    });

    if (_formKey.currentState!.validate() &&
        _isEmailValid &&
        _isPasswordValid) {
      showSnackBar(context, 'Sign up successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF4F9FF), Color(0xFFE0EDFB)],
                ),
              ),
            ),
            Positioned.fill(
                child: SafeArea(
              child: SvgPicture.asset(
                'assets/images/sign-up-screen-bg.svg',
                fit: BoxFit.contain,
              ),
            )),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 94),
                        const HeadlineText('Sign up'),
                        const SizedBox(height: 40),
                        EmailInput(
                          key: const Key('emailInputKey'),
                          controller: _emailController,
                          validator: _emailValidator,
                          isSubmitted: _isSubmitted,
                          isValid: _isEmailValid,
                        ),
                        const SizedBox(height: 20),
                        PasswordInput(
                          key: const Key('passwordInputKey'),
                          controller: _passwordController,
                          validator: _passwordValidator,
                          isSubmitted: _isSubmitted,
                          isValid: _isPasswordValid,
                        ),
                        const SizedBox(height: 20),
                        SignUpRules(
                          isSubmitted: _isSubmitted,
                          characterCount:
                              _passwordController.text.length >= 8 &&
                                  _passwordController.text.length <= 64,
                          upperCaseAndLowerCase: ValidationRegexps
                                  .lowerCaseRegex
                                  .hasMatch(_passwordController.text) &&
                              ValidationRegexps.upperCaseRegex
                                  .hasMatch(_passwordController.text),
                          oneDigit: ValidationRegexps.digitRegex
                              .hasMatch(_passwordController.text),
                        ),
                        const SizedBox(height: 40),
                        SignUpButton(onPressed: _submitForm, text: 'Sign up'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
