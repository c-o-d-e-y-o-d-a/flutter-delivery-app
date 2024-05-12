import 'package:delv/components/my_current_location.dart';
import 'package:delv/components/my_description_box.dart';
import 'package:delv/components/my_drawer.dart';
import 'package:delv/components/my_silver_app_bar.dart';
import 'package:delv/components/my_tab_bar.dart';
import 'package:delv/models/food.dart';
import 'package:delv/models/restraunts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }


  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();

  }


  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {

      List<Food> categoryMenu = _filterMenuByCategory(category,fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return ListTile(
            title: Text(categoryMenu[index].name),
          );

        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      drawer: const MyDrawer(),

      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled) => [
           MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent:25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      MyCurrentLocation(),


                      MyDescriptionBox(),

                    ],
                  ),
            
            ),

        ],


        body : Consumer<Restraunt>(
          builder: (context, restraunt, child) => TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restraunt.menu),
        ))
      ),
    );
  }
}