import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_button.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<PaymentMethod> methods = [];

  @override
  void initState() {
    super.initState();
    methods.add(PaymentMethod(
        image: "assets/icons/card.svg", title: "Card", color: tahiti));
    methods.add(PaymentMethod(
        image: "assets/icons/paypal.svg", title: "Paypal", color: french));
    methods.add(PaymentMethod(
        image: "assets/icons/bank.svg", title: "Bank", color: blue));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gallery,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.050,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: AppText(
                        text: "My Profile",
                        color: Colors.black,
                        size: 18,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            AppText(
              text: "Information",
              color: Colors.black,
              size: 17,
              textAlign: TextAlign.start,
              weight: FontWeight.w600,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/profile.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Marvis Ighedosa",
                          color: Colors.black,
                          size: 18,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: "dosamarvis@gmail.com",
                          color: Colors.black,
                          size: 13,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text:
                              "No 15 uti street off ovie palace road effurun delta state",
                          color: Colors.black,
                          size: 13,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppText(
              text: "Payment Method",
              color: Colors.black,
              size: 17,
              textAlign: TextAlign.start,
              weight: FontWeight.w600,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: ListView.separated(
                    itemCount: methods.length,
                    padding: EdgeInsets.only(bottom: 8, top: 16),
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 1,
                        color: black_05,
                        margin: EdgeInsets.symmetric(horizontal: 24),
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: vermilion,
                              groupValue: "",
                              onChanged: (dynamic val) {},
                            ),
                            Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: methods[index].color,
                                    borderRadius: BorderRadius.circular(16)),
                                child: SvgPicture.asset(methods[index].image!)),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: methods[index].title,
                              size: 17,
                              weight: FontWeight.w400,
                              color: Colors.black,
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            AppButton(
                bgColor: vermilion,
                borderRadius: 30,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                onTap: () {
                  // Navigator.pushNamed(context, Routes.home);
                },
                text: "Updatet ",
                textColor: athens_gray)
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String? image;
  final String? title;
  final Color? color;
  PaymentMethod({this.color, this.image, this.title});
}
