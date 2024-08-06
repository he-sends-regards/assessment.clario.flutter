import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clario_assessment_flutter/widgets/sign_up_button.dart';
import 'package:clario_assessment_flutter/widgets/Headline.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';
import '../widgets/sign_up_rules.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF4F9FF), Color(0xFFE0EDFB)],
          ),
        ),
        child: SafeArea(
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
                    ),
                    const SizedBox(height: 20),
                    PasswordInput(
                      key: const Key('passwordInputKey'),
                      controller: _passwordController,
                      validator: _passwordValidator,
                    ),
                    const SizedBox(height: 20),
                    const SignUpRules(
                      isSubmitted: false,
                      characterCount: false,
                      upperCaseAndLowerCase: false,
                      oneDigit: false,
                    ),
                    const SizedBox(height: 40),
                    SignUpButton(onPressed: () => {}, text: 'Sign up'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
