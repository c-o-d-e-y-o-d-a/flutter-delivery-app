import 'package:delv/components/my_cart_tile.dart';
import 'package:delv/models/cart_item.dart';
import 'package:delv/models/restraunts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(
      builder: (context, restraunt, child) {

        final userCart = restraunt.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions:[
              IconButton(
                onPressed: (){
                  showDialog(
                   context: context,
                   builder: (context) => AlertDialog(
                    title: Text("Are you sure you want to clear cart?"),

                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                         child: const Text("Cancel"),
                         ),

                        TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          restraunt.clearCart();
                        },
                         child: const Text("Yes"),
                         ),

                      
                      
                    ],
                   )
                   );
                   
                },
                icon: const Icon(Icons.delete),
                )
            ]
          ),
          body: Column(
            children: [
              userCart.isEmpty
              ? const Text("Cart is Empty"):
              
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,


                itemBuilder: (context,index){
                  final CartItem = userCart[index];

                  return MyCartTile(cartItem: CartItem);

                },
                ),
              )
                
              
            ],
          ),
        );
      },
    );
  }
}
