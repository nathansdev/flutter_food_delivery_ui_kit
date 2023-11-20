import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/login/login_input_screen.dart';
import 'package:flutter_ui_food_delivery_app/login/sign_up_input_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: const TabBarView(
                        children: [LoginInputScreen(), SignUpInputScreen()]),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 4), color: Colors.white)
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/icons/bell_big.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: "Login",
                            ),
                            Tab(
                              text: "Sign-Up",
                            )
                          ],
                          labelColor: Colors.black,
                          indicatorColor: vermilion,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
