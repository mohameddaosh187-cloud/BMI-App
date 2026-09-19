import 'package:bmi_app/screens/home_screen.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatefulWidget {
  const BMIApp({super.key});

  @override
  State<BMIApp> createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  bool isDarkMode = true;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) =>
            HomeScreen(isDarkMode: isDarkMode, onThemeChanged: toggleTheme),
        ResultScreen.route: (context) => ResultScreen(),
      },
    );
  }
}
