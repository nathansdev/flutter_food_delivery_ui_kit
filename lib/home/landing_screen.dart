import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/main_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/navigation_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen();

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: [menu(), mainScreen()],
      ),
    );
  }

  Widget menu() {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: NavigationScreen(
          collabsed: isCollapsed,
          onTap: () {
            setState(() {
              if (isCollapsed)
                _controller.forward();
              else
                _controller.reverse();

              isCollapsed = !isCollapsed;
            });
          },
        ),
      ),
    );
  }

  Widget mainScreen() {
    return AnimatedPositioned(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isCollapsed ? 0 : 24),
              bottomLeft: Radius.circular(isCollapsed ? 0 : 24)),
          child: MainScreen(
            collabsed: isCollapsed,
            onTap: () {
              setState(() {
                if (isCollapsed)
                  _controller.forward();
                else
                  _controller.reverse();

                isCollapsed = !isCollapsed;
              });
            },
          ),
        ),
      ),
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
    );
  }
}
