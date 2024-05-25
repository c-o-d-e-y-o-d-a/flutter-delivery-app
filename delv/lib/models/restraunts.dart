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
      imagePath: "lib/images/burgers/burger.png",
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
      imagePath: "lib/images/burgers/burger.png",
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
      imagePath: "lib/images/burgers/burger.png",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),

    Food(
      name: "Paneer Burger",
      description:
          "Smoky BBQ sauce, crispy Paneer patty, and onions make this vegan burger a savory delight.",
      imagePath: "lib/images/burgers/burger.png",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Peri Peri sauce", price: 0.99),
      ],
    ),

    //sweets

    Food(
      name: "Gulab Jamun",
      description:
          "A sweet Indian dessert made from milk solids and sugar, often garnished with nuts.",
      imagePath: "lib/images/desserts/gulabjamun.png",
      price: 2,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Kaju Katli",
      description:
          "A traditional Indian dessert made with cashew nuts, sugar, and ghee butter.",
      imagePath: "lib/images/desserts/kajukatli.png",
      price: 2,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Ras Malai",
      description:
          "An Indian dessert of cottage cheese balls soaked in clotted cream, served cold.",
      imagePath: "lib/images/desserts/rasmalai.png",
      price: 2,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    //drinks

    Food(
      name: "Amul Lassi ",
      description:
          "A refreshing, protein-rich Indian drink with various flavors like Rose and Mango.",
      imagePath: "lib/images/drinks/amulLassi.png",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    Food(
      name: "Coca cola ",
      description:
          " A globally popular carbonated soft drink with a distinct cola flavor.",
      imagePath: "lib/images/drinks/cocaCola.png",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    Food(
      name: "Thumbs up ",
      description:
          " An Indian cola brand known for its strong, fizzy taste and charismatic appeal.",
      imagePath: "lib/images/drinks/thumbsup.png",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    //salads

    Food(
      name: "Ceasers Salad",
      description:
          "A classic salad with romaine lettuce, croutons, and a tangy dressing.",
      imagePath: "lib/images/salads/ceasersSalad.png",
      price: 8,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Cream cheese", price: 0.99),
        Addon(name: "Extra olive oil", price: 0.99),
      ],
    ),

    Food(
      name: "Paneer Salad",
      description:
          "A flavorful Indian salad with pan-fried paneer and vegetables in a lemon-honey-ginger dressing",
      imagePath: "lib/images/salads/paneerSalad.png",
      price: 8,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Cream cheese", price: 0.99),
        Addon(name: "Extra olive oil", price: 0.99),
      ],
    ),

    //sides

    Food(
      name: "Crispy Fries ",
      description: "Crispy Hand cut well seasones potatoe fries ",
      imagePath: "lib/images/sides/fries.png",
      price: 8,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cream cheese", price: 0.99),
        Addon(name: "Special spice mix", price: 0.99),
      ],
    ),

    Food(
      name: "Peri peri sauce",
      description: "Peri peri sauce",
      imagePath: "lib/images/sides/periPeriDip.png",
      price: 8,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
  ];

  //getters

  List<Food> get menu => _menu;

  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  //O P E R A T I O N S

  void addToCart(Food food, List<Addon> selectedAddons) {
    // Check if the cart already contains this food item with the same add-ons
    final existingCartItemIndex = _cart.indexWhere(
      (item) =>
          item.food == food &&
          ListEquality().equals(item.selectedAddons, selectedAddons),
    );

    if (existingCartItemIndex != -1) {
      // If it exists, increment the quantity
      _cart[existingCartItemIndex].quantity++;
    } else {
      // If it does not exist, add a new item to the cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    // Notify listeners about the change
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

  void updateDeliveryAddress(String newAddress) {
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
