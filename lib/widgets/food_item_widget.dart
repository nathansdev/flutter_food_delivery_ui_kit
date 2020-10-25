import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';

class FoodItemWidget extends StatelessWidget {
  final Food food;
  const FoodItemWidget({this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white, offset: Offset(0, 0))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppText(
                    text: "Veggie tomato mix",
                    color: black_90,
                    size: 22,
                    weight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppText(
                    text: "N1,900",
                    color: vermilion,
                    size: 17,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
