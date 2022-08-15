import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class NavigationScreen extends StatefulWidget {
  final bool? collabsed;
  final VoidCallback? onTap;
  NavigationScreen({this.collabsed, this.onTap});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<NavOption> options = [];
  @override
  void initState() {
    super.initState();
    options.add(
        NavOption(title: "Profile", assetPath: "assets/icons/profile.svg"));
    options.add(NavOption(title: "Orders", assetPath: "assets/icons/buy.svg"));
    options.add(NavOption(
        title: "Offer and Promo", assetPath: "assets/icons/offer.svg"));
    options.add(
        NavOption(title: "Privacy Policy", assetPath: "assets/icons/note.svg"));
    options.add(
        NavOption(title: "Security", assetPath: "assets/icons/security.svg"));
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    // double sizeHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: vermilion,
            borderRadius: BorderRadius.circular(widget.collabsed! ? 24 : 0)),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(32),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onTap!();
                        Navigator.of(context)
                            .pushNamed("/" + options[index].title.toString());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset(options[index].assetPath),
                            SizedBox(
                              width: 20,
                            ),
                            AppText(
                              text: options[index].title,
                              size: 17,
                              weight: FontWeight.w600,
                              color: Colors.white,
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 42.0, top: 8, bottom: 8, right: 150),
                      child: Container(
                        width: sizeWidth * 0.5,
                        height: 1,
                        color: athens_gray_one,
                      ),
                    );
                  },
                  itemCount: options.length,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [
                    AppText(
                      text: "Sign-out",
                      size: 17,
                      weight: FontWeight.w600,
                      color: Colors.white,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavOption {
  final title;
  final assetPath;
  NavOption({this.title, this.assetPath});
}
