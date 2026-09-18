import 'dart:math';

import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/gender_widget.dart';
import 'package:bmi_app/widgets/info_user_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});
  static String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchBtn = false;
  bool isMale = true;
  int height = 150;
  int weight = 5;
  int age = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBar(
        centerTitle: true,
        elevation: 100,
        backgroundColor: Color(0xff24263B),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: .w600,
            color: Color(0xffFFFFFF),
          ),
        ),
        leading: Switch(
          value: switchBtn,
          onChanged: (value) {
            switchBtn = value;
            setState(() {});
          },
          activeColor: Color(0xff3D81E8),
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
                    isMale = true;
                    setState(() {});
                  },
                  image: "assets/icons/male-icon.png",
                  title: "Male",
                ),
                GenderWidget(
                  isSelected: !isMale,
                  onTap: () {
                    isMale = false;
                    setState(() {});
                  },
                  image: "assets/icons/female-icon.png",
                  title: "Female",
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .w400,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: height.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: .w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'cm',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: .w400,
                              color: Color(0xff8B8C9E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      min: 50,
                      max: 250,
                      activeColor: Color(0xff3D81E8),
                      value: height.toDouble(),
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
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
                      if (weight <= 100) {
                        weight++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (weight >= 2) {
                        weight--;
                        setState(() {});
                      }
                    },
                  ),
                  InfoUserWidget(
                    title: "Age",
                    value: age,
                    add: () {
                      if (age <= 50) {
                        age++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (age >= 1) {
                        age--;
                        setState(() {});
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
  const new({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff3D81E8),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        title,
        style: TextStyle(fontSize: 32, fontWeight: .w600, color: Colors.white),
      ),
    );
  }
}
