import 'package:flutter/material.dart';


class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});


  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
      title: Text("Your location"),
      content: TextField(
        decoration: const InputDecoration(hintText: "Search address..."),
      ),

      actions: [
        MaterialButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
        ),

        MaterialButton(onPressed: () => Navigator.pop(context),
        child: const Text("Save"),
        ),
      ],
     ),
     );
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
        Text(
          "Deliver Now",
          style: TextStyle(color:Theme.of(context).colorScheme.primary),
          ),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(
          children: [
            Text(
              "6901 Hollywood Blv",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
        ),
      ],
      
    );
  }
}