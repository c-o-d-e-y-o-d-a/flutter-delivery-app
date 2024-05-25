import 'package:delv/models/restraunts.dart';
import 'package:flutter/material.dart';
import 'package:delv/components/my_button.dart';
import 'package:delv/models/food.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  // Constructor with required Food parameter
  FoodPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> selectAddons;

  @override
  void initState() {
    super.initState();
    selectAddons = {
      for (Addon addon in widget.food.availableAddons) addon: false
    };
  }

  void addToCart(Food food) {
    // Format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restraunt>().addToCart(food, currentlySelectedAddons);

    // Close the current food page to go back to the menu
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.food.imagePath,
              height: 200, // Set height for the image
              width: double.infinity, // Take full width
              fit: BoxFit.cover, // Adjust image size and aspect ratio
            ),
            SizedBox(height: 16.0),
            Text(
              widget.food.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${widget.food.price.toString()}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.food.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Divider(color: Theme.of(context).colorScheme.secondary),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Add-ons",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.food.availableAddons.length,
                itemBuilder: (context, index) {
                  Addon addon = widget.food.availableAddons[index];
                  return CheckboxListTile(
                    title: Text(
                    addon.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    subtitle: Text(
                      '\$${addon.price.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    value: selectAddons[addon],
                    onChanged: (bool? value) {
                      setState(() {
                        selectAddons[addon] = value!;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: MyButton(
                text: "Add to cart",
                onTap: () {
                  addToCart(widget.food);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
