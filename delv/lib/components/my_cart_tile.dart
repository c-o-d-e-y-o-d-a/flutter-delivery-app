import 'package:delv/components/my_quantity_selector.dart';
import 'package:delv/models/cart_item.dart';
import 'package:delv/models/restraunts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem,});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(
      builder: (context, restraunt, child) => SizedBox(
        height: 250,
        child: 
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.food.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${cartItem.food.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
          
                            
                            const SizedBox(height: 10),
          
          
                            QuantitySelector(
                              quantity: cartItem.quantity,
                              food: cartItem.food,
                              onDecrement: () {
                                restraunt.removeFromCart(cartItem);
                              },
                              onIncrement: () {
                                restraunt.addToCart(
                                    cartItem.food, cartItem.selectedAddons);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (cartItem.selectedAddons.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cartItem.selectedAddons.length,
                        itemBuilder: (context, index) {
                          final addon = cartItem.selectedAddons[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                addon.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        
      ),
    );
  }
}
