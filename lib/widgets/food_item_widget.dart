import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/detail_screen.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class FoodItemWidget extends StatelessWidget {
  final Food? food;
  const FoodItemWidget({Key? key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(food: food),
          ),
        );
        // Navigator.of(context).pushNamed(Routes.detail);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.31,
        padding: const EdgeInsets.all(6),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.white, offset: Offset(0, 0))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: AppText(
                        text: "Veggie tomato mix",
                        color: black_90,
                        size: 22,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: AppText(
                        text: "N1,900",
                        color: vermilion,
                        size: 17,
                        weight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(food!.image!),
            )
          ],
        ),
      ),
    );
  }
}
