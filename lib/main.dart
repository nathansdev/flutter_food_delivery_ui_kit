import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/cart/cart_screen.dart';
import 'package:flutter_ui_food_delivery_app/cart/payment_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/detail_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/landing_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/search_screen.dart';
import 'package:flutter_ui_food_delivery_app/login/intro_screen.dart';
import 'package:flutter_ui_food_delivery_app/login/login_screen.dart';
import 'package:flutter_ui_food_delivery_app/profile/profile_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const IntroScreen(),
      routes: {
        Routes.home: (context) => const LandingScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.intro: (context) => const IntroScreen(),
        Routes.detail: (context) => const DetailScreen(),
        Routes.search: (context) => const SearchScreen(),
        Routes.profile: (context) => const ProfilePage(),
        Routes.cart: (context) => const CartScreen(),
        Routes.payment: (context) => const PaymentScreen()
      },
    );
  }
}
