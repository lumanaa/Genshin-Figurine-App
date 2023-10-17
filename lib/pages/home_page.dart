import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/figurine_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage())),
        child: Icon(Icons.shopping_bag_outlined),
        backgroundColor: Color.fromARGB(255, 248, 169, 110),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/83/14/6b/83146bc4f49956b54cda3dff6ab64d61.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Genshin Impact',
                  style: GoogleFonts.patrickHand(
                      textStyle: TextStyle(fontSize: 32, color: Colors.white)),
                )),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Buy Official Genshin Figurines',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Best Prices',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: 100,
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 10),
                itemBuilder: (context, index) => FigurineTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  itemPath: value.shopItems[index][2],
                  element: value.shopItems[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addItemtoCart(index);
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
