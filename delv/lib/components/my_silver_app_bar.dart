import 'package:flutter/material.dart';


class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
  });



  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned:true,
      actions: [
        IconButton(onPressed: (){},
         icon: Icon(Icons.shopping_cart),
         )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
      title:title,
      centerTitle: true,
      titlePadding: const EdgeInsets.only(left: 0, right:0, top:0),
      )
    );
  }
}