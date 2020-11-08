import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback onTap;
  final bool collabsed;
  MainScreen({this.onTap, this.collabsed});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> widgets = [];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    widgets.add(HomeScreen());
    widgets.add(HomeScreen());
    widgets.add(HomeScreen());
    widgets.add(HomeScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: concrete,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: concrete),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: concrete,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("Search"),
              icon: Icon(Icons.favorite_border),
            ),
            BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.account_circle),
            ),
            BottomNavigationBarItem(
              title: Text("History"),
              icon: Icon(Icons.history),
            ),
          ],
          unselectedItemColor: manatee,
          currentIndex: _selectedIndex,
          selectedItemColor: vermilion,
          onTap: _onItemTapped,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.collabsed ? 24 : 0)),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: SvgPicture.asset(
                        "assets/icons/navigation.svg",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                widgets.elementAt(_selectedIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
