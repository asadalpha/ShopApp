import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}

final shopitems = [
  {
    "id": "0",
    "title": "Gucci shirt",
    "price": "INR 123",
    "imageID": "assets/girl1.jpg",
    "size": ["S", "M", "L"]
  },
  {
    "id": "1",
    "title": "Top",
    "price": "\$ 123",
    "imageID": "assets/2.jpg",
    "size": ["S", "M", "L"]
  },
  {
    "id": "2",
    "title": "Carpe Diem",
    "price": "\$ 123",
    "imageID": "assets/3.jpg",
    "size": ["S", "M", "L"]
  },
  {
    "id": "3",
    "title": "Tshirt",
    "price": "\$ 123",
    "imageID": "assets/4.jpg",
    "size": ["S", "M", "L"]
  },
  {
    "id": "4",
    "title": "Hoodie",
    "price": "\$ 123",
    "imageID": "assets/5.jpg",
    "size": ["S", "M", "L"]
  },
];
