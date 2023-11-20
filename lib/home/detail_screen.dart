import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/circle_dot_widget.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class DetailScreen extends StatefulWidget {
  final Food? food;

  const DetailScreen({Key? key, this.food}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController? _pageController;
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
    _pageController!.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView.builder(
                      physics: const ClampingScrollPhysics(),
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
                            const CircleDotWidget(
                              isActive: true,
                              color: vermilion,
                              borderColor: vermilion,
                            )
                          ] else
                            const CircleDotWidget(
                              isActive: false,
                              color: silverOne,
                              borderColor: silverOne,
                            ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(16)),
                  const AppText(
                    text: "Veggie tomato mix",
                    size: 28,
                    color: Colors.black,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  const AppText(
                    text: "N1,900",
                    size: 22,
                    color: vermilion,
                    weight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(16)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Delivery info",
                      size: 17,
                      color: Colors.black,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  const AppText(
                    text:
                        "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                    size: 15,
                    color: black_50,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                  const Padding(padding: EdgeInsets.all(16)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Return policy",
                      size: 17,
                      color: Colors.black,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  const AppText(
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
                      textColor: athensGray)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
