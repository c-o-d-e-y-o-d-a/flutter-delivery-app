import 'package:delv/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {

  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,

  });

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category){

      return Tab(
        child: Text(
        category.toString().split('.').last,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          ),
         // Change the fontSize to your desired size
  ),
        
      );

    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}