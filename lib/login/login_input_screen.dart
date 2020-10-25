import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/utils/routes.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_input.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class LoginInputScreen extends StatefulWidget {
  LoginInputScreen();

  @override
  _LoginInputScreenState createState() => _LoginInputScreenState();
}

class _LoginInputScreenState extends State<LoginInputScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                controller: emailController,
                enable: true,
                title: "Email address",
                hint: "sabari@gmail.com",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 42),
              child: AppInputText(
                controller: passwordController,
                enable: true,
                title: "Password",
                hint: "*********",
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
                onTap: () {
                  Navigator.pushNamed(context, Routes.home);
                },
                text: "Login",
                textColor: athens_gray)
          ],
        ),
      ),
    );
  }
}
