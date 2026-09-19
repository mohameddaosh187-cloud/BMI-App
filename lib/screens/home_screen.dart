import 'dart:math';

import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/gender_widget.dart';
import 'package:bmi_app/widgets/info_user_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  static String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  int height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isDarkMode
        ? const Color(0xff1C2135)
        : Colors.grey[200];
    final cardColor = widget.isDarkMode
        ? const Color(0xff333244)
        : Colors.white;
    final appBarColor = widget.isDarkMode
        ? const Color(0xff24263B)
        : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: appBarColor,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        leading: Switch(
          value: widget.isDarkMode,
          onChanged: widget.onThemeChanged,
          activeColor: const Color(0xff3D81E8),
          inactiveThumbColor: Colors.grey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 25,
          children: [
            Row(
              spacing: 10,
              children: [
                GenderWidget(
                  isSelected: isMale,
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  image: "assets/icons/male-icon.png",
                  title: "Male",
                ),
                GenderWidget(
                  isSelected: !isMale,
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  image: "assets/icons/female-icon.png",
                  title: "Female",
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: height.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        children: const [
                          TextSpan(
                            text: 'cm',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8B8C9E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      min: 50,
                      max: 250,
                      activeColor: const Color(0xff3D81E8),
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  InfoUserWidget(
                    title: "Weight",
                    value: weight,
                    add: () {
                      if (weight <= 200) {
                        setState(() {
                          weight++;
                        });
                      }
                    },
                    remove: () {
                      if (weight >= 2) {
                        setState(() {
                          weight--;
                        });
                      }
                    },
                  ),
                  InfoUserWidget(
                    title: "Age",
                    value: age,
                    add: () {
                      if (age <= 120) {
                        setState(() {
                          age++;
                        });
                      }
                    },
                    remove: () {
                      if (age >= 1) {
                        setState(() {
                          age--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonBMI(
        title: 'Calculate',
        onPressed: () {
          var user = UserBmiModel(
            gender: isMale ? "Male" : "Female",
            height: height,
            weight: weight,
            age: age,
          );
          Navigator.of(context).pushNamed(ResultScreen.route, arguments: user);
        },
      ),
    );
  }
}

class CustomButtonBMI extends StatelessWidget {
  const CustomButtonBMI({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xff3D81E8),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
