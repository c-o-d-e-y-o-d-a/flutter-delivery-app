import 'package:delv/components/my_current_location.dart';
import 'package:delv/components/my_description_box.dart';
import 'package:delv/components/my_drawer.dart';
import 'package:delv/components/my_food_tile.dart';
import 'package:delv/components/my_silver_app_bar.dart';
import 'package:delv/components/my_tab_bar.dart';
import 'package:delv/models/food.dart';
import 'package:delv/models/restraunts.dart';
import 'package:delv/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> _getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          drawer: const MyDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MySilverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    MyCurrentLocation(),
                    MyDescriptionBox(),
                  ],
                ),
              ),
            ],
            body: Consumer<Restraunt>(
              builder: (context, restraunt, child) => TabBarView(
                controller: _tabController,
                children: _getFoodInThisCategory(restraunt.menu),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}


// SafeArea(
//           child: Opacity(
//             opacity: 0.6,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_rounded),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ),
//         ),