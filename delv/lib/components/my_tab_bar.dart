import 'package:delv/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {

  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,

  });

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            category.toString().split('.').last,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
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