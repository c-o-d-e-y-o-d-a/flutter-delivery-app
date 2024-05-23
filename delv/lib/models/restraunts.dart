import 'package:flutter/material.dart';
import 'package:delv/models/cart_item.dart';
import 'package:delv/models/food.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';


class Restraunt extends ChangeNotifier {

  String _deliveryAddress = '99 Hollywood Blv';
  String get deliveryAddress => _deliveryAddress;


  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic CheeseBurger",
      description:
          "A juicy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Smoky BBQ sauce, crispy bacon, and onion rings make this burger a savory delight.",
      imagePath: "path",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
      ],
    ),
    Food(
      name: "Vegan Burger",
      description:
          "Smoky BBQ sauce, crispy tofu, and onion rings make this vegan burger a savory delight.",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),
    // Add more food items here...
  ];

  List<Food> get menu => _menu;

  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addon> selectedAddons) {
    final cartItem = _cart.firstWhere(
      (item) =>
          item.food == food &&
          ListEquality().equals(item.selectedAddons, selectedAddons),
      orElse: () => CartItem(food: food, selectedAddons: selectedAddons),
    );

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();


  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }

      receipt.writeln();
    }

    receipt.writeln("--------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');


    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}

