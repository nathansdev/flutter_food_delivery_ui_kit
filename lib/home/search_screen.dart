import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/home/home_screen.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';
import 'package:flutter_ui_food_delivery_app/widgets/food_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller =
      TextEditingController(text: "Spicy chieckns");
  List<Food> foods = [];

  @override
  void initState() {
    foods.add(Food(id: 1, name: "", image: "assets/images/foods/one.png"));
    foods.add(Food(id: 2, name: "", image: "assets/images/foods/two.png"));
    foods.add(Food(id: 3, name: "", image: "assets/images/foods/three.png"));
    foods.add(Food(id: 4, name: "", image: "assets/images/foods/four.png"));
    foods.add(Food(id: 5, name: "", image: "assets/images/foods/one.svg"));
    foods.add(Food(id: 6, name: "", image: "assets/images/foods/two.svg"));
    foods.add(Food(id: 7, name: "", image: "assets/images/foods/three.svg"));
    foods.add(Food(id: 8, name: "", image: "assets/images/foods/four.svg"));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: gallery,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            decoration: const BoxDecoration(
                color: alabaster,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppText(
                    text: "Found  6 results",
                    size: 28,
                    color: Colors.black,
                    weight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                    child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return FoodItemWidget(
                      food: foods[index],
                    );
                  },
                  itemCount: foods.length,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
