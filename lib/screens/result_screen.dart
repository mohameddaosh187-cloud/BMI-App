import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const new({super.key});
  static String route = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as UserBmiModel;
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: .bold,
                color: Color(0xffFFFFFF),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      arg.stringView,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: Color(0xff21BF73),
                      ),
                    ),
                    SizedBox(height: 33),
                    Text(
                      arg.resulteBmi.toString(),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: .bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      "You Have a Normal Body Weight,Good Job.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Color(0xff8B8C9E),
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonBMI(
        title: "Re - Calculate",
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
