import 'package:bmi_app/screens/home_screen.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        ResultScreen.route: (context) => ResultScreen(),
      },
    );
  }
}
