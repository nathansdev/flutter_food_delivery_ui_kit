import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery_app/utils/colors.dart';
import 'package:flutter_ui_food_delivery_app/widgets/custom_text.dart';
import 'package:flutter_ui_food_delivery_app/widgets/food_item_widget.dart';
import 'package:flutter_ui_food_delivery_app/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Food> foods = [];
  List<Widget> tabs = [];
  List<Widget> contents = [];
  TextEditingController _controller = TextEditingController();
  TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    foods.add(Food());
    foods.add(Food());
    foods.add(Food());
    foods.add(Food());
    foods.add(Food());
    foods.add(Food());
    foods.add(Food());

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
    _tabController.dispose();
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
              enable: true,
              hint: "Search",
              controller: _controller,
            ),
          ),
          TabBar(
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
                _tabController.animateTo(index);
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
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
  final String name;
  final String id;
  Food({this.name, this.id});
}
