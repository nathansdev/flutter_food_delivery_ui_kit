import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/utils/routes.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';
import 'package:flutter_ui_food_delivery_app/widgets/food_item_widget.dart';
import 'package:flutter_ui_food_delivery_app/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Food> foods = [];
  List<Widget> tabs = [];
  List<Widget> contents = [];
  TextEditingController _controller = TextEditingController();
  TabController? _tabController;
  int selectedIndex = 0;

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

    tabs.add(Tab(
      text: "Foods",
    ));
    tabs.add(Tab(
      text: "Drinks",
    ));
    tabs.add(Tab(
      text: "Snacks",
    ));
    tabs.add(Tab(
      text: "Sauce",
    ));
    contents.add(ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return FoodItemWidget(
          food: foods[index],
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
    ));
    contents.add(Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return FoodItemWidget(
              food: foods[index],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: foods.length,
        )));
    contents.add(Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return FoodItemWidget(
              food: foods[index],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: foods.length,
        )));
    contents.add(Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return FoodItemWidget(
              food: foods[index],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: foods.length,
        )));
    super.initState();
    _tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppText(
                    text: "Delicious food for you",
                    size: 34,
                    color: Colors.black,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 0,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SearchBox(
              enable: false,
              hint: "Search",
              controller: _controller,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.search);
              },
            ),
          ),
          TabBar(
            isScrollable: true,
            tabs: tabs,
            labelColor: vermilion,
            labelStyle: TextStyle(color: vermilion, fontSize: 17),
            unselectedLabelStyle: TextStyle(color: vermilion, fontSize: 17),
            unselectedLabelColor: manatee,
            indicatorColor: vermilion,
            controller: _tabController,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                _tabController!.animateTo(index);
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: IndexedStack(
              children: contents,
              index: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class Food {
  final String? name;
  final int? id;
  final String? image;
  Food({this.name, this.id, this.image});
}
