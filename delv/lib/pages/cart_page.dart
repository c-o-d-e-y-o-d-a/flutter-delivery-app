import 'package:delv/components/my_cart_tile.dart';
import 'package:delv/models/restraunts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(builder: (context, restraunt, child) {
      final userCart = restraunt.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];

                    //get individual cart item

                    //return cart tile UI
                    return MyCartTile( cartItem: cartItem, );
                  }))
        ]),
      );
    });
  }
}
