import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: GoogleFonts.neucha(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              value.cartItems[index][2],
                              height: 150,
                            ),
                            Column(
                              children: [
                                Text(
                                  value.cartItems[index][0],
                                  style: GoogleFonts.sriracha(),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text('\$' + value.cartItems[index][1])
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index);
                                },
                                icon: Icon(Icons.cancel_outlined)),
                          ],
                        ),
                      ),
                    );
                  },
                )),

                //total + pay now
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 169, 110),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total Price: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(value.calculateTotal(),
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.payment),
                        label: Text("Pay Now"),
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.all(15.0),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 248, 145, 110))),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
