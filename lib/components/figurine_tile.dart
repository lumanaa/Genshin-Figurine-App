import 'package:flutter/material.dart';

class FigurineTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final String element;
  void Function()? onPressed;

  FigurineTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemPath,
      required this.element,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double gridWidth = screenWidth * 0.8;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              itemPath,
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('\$' + itemPrice), Text(element)],
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Add to Cart'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 244, 177, 126))),
            )
          ],
        ),
      ),
    );
  }
}
