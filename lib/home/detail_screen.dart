import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/circle_dot_widget.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class DetailScreen extends StatefulWidget {
  final Food food;
  DetailScreen({this.food});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController _pageController;
  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;
  final List<Widget> images = [];

  @override
  void initState() {
    images.add(Image.asset("assets/images/foods/one.png"));
    images.add(Image.asset("assets/images/foods/two.png"));
    images.add(Image.asset("assets/images/foods/three.png"));
    images.add(Image.asset("assets/images/foods/four.png"));
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void animatePage(int page) {
    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView.builder(
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return images[index];
                      },
                      onPageChanged: (int page) {
                        animatePage(page);
                      },
                      itemCount: images.length,
                      controller: _pageController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < images.length; i++)
                          if (i == currentPageValue) ...[
                            CircleDotWidget(
                              isActive: true,
                              color: vermilion,
                              borderColor: vermilion,
                            )
                          ] else
                            CircleDotWidget(
                              isActive: false,
                              color: silver_one,
                              borderColor: silver_one,
                            ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  AppText(
                    text: "Veggie tomato mix",
                    size: 28,
                    color: Colors.black,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  AppText(
                    text: "N1,900",
                    size: 22,
                    color: vermilion,
                    weight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Delivery info",
                      size: 17,
                      color: Colors.black,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  AppText(
                    text:
                        "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                    size: 15,
                    color: black_50,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Return policy",
                      size: 17,
                      color: Colors.black,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  AppText(
                    text:
                        "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                    size: 15,
                    color: black_50,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                  AppButton(
                      bgColor: vermilion,
                      borderRadius: 30,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.home);
                      },
                      text: "Add to cart ",
                      textColor: athens_gray)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
