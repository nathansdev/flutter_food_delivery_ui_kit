import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/detail_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/landing_screen.dart';
import 'package:flutter_ui_food_delivery_app/login/intro_screen.dart';
import 'package:flutter_ui_food_delivery_app/login/login_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App - Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Rounded',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
      routes: {
        Routes.home: (context) => LandingScreen(),
        Routes.login: (context) => LoginScreen(),
        Routes.intro: (context) => IntroScreen(),
        Routes.detail: (context) => DetailScreen()
      },
    );
  }
}
