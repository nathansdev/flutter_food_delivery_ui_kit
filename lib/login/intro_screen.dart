import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/utils/routes.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sunset_orange,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/icons/bell.png"),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppText(
                  size: 65,
                  color: Colors.white,
                  text: "Food for Everyone",
                  weight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/toyface_right.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/toyface_left.png",
              height: MediaQuery.of(context).size.height * 0.55,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[vermilion_10, vermilion_100],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: AppButton(
              text: "Get Started",
              bgColor: Colors.white,
              textColor: vermilion,
              borderRadius: 30,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              onTap: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          )
        ],
      ),
    );
  }
}
