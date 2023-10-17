import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    ["Hutao", "150.00", "assets/hutao.jpg", "Pyro"],
    ["Klee", "120.00", "assets/klee.jpg", "Pyro"],
    ["Shogun", "250.00", "assets/shogun.jpg", "Electro"],
    ["Yaemiko", "230.00", "assets/yae.jpg", "Electro"]
  ];

  //list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemtoCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
