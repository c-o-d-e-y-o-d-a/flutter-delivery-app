import 'package:flutter/material.dart';

import 'food.dart';

class Restraunt extends ChangeNotifier{

  final List<Food> _menu = [
    //burgers

    Food(
      name: "Classic CheeseBurger",
      description: "A juicy patty with melted cheddar , lettuc , tomato and a hint of onion and pickle.",
      imagePath: "",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name:"Extra cheese",price : 0.99),
        Addon(name:"Bacon", price:0.99),
        Addon(name:"Extra cheese", price:0.99),
      ],
      ),

      Food(
      name: "BBQ Bacon Burger",
      description:
          "smoky BBQ sauce , crispy bacon and onion rings make this burger a savoury delight",
      imagePath: "path",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),

    Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),

    Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),


Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),


Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),



Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),


Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),


Food(
      name: "Vegan Burger",
      description:
          "smoky BBQ sauce , crispy tofu and onion rings make this vegan burger a savoury delight",
      imagePath: "path",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra `cheese`", price: 0.99),
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),


    // desserts

    //drinks

    // salads

    //sides


  ];

  List<Food> get menu => _menu;
  




 /* G E T T E R S */ 



 /* O P E R A T I O N S */ 


 //add to cart


 //remove from cart


//get total price of cart


// get total number of items

// clear cart 


/* generate a receipt */



 /* HELPERS */ 
}