import 'package:flutter/material.dart';
import 'screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clario Asessment',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16),
          bodyText2: TextStyle(fontSize: 13, height: 1.8),
          button: TextStyle(height: 14),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}
