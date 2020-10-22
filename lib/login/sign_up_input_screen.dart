import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_input.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class SignUpInputScreen extends StatefulWidget {
  SignUpInputScreen();

  @override
  _SignUpInputScreenState createState() => _SignUpInputScreenState();
}

class _SignUpInputScreenState extends State<SignUpInputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 42),
              child: AppInputText(
                controller: nameController,
                enable: true,
                hint: "Sabari",
                title: "Name",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 42),
              child: AppInputText(
                controller: emailController,
                enable: true,
                hint: "sabari@gmail.com",
                title: "Email address",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 42),
              child: AppInputText(
                controller: passwordController,
                enable: true,
                hint: "*********",
                title: "Password ",
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 42),
                child: AppText(
                  color: vermilion,
                  size: 17,
                  weight: FontWeight.w600,
                  text: "Forgot passcode?",
                ),
              ),
            ),
            AppButton(
                bgColor: vermilion,
                borderRadius: 30,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                onTap: () {},
                text: "Login",
                textColor: athens_gray)
          ],
        ),
      ),
    );
  }
}
