import 'package:flutter/material.dart';

class WishlistController extends ChangeNotifier {
  // Singleton pattern biar bisa diakses dari mana saja
  static final WishlistController instance = WishlistController._internal();
  WishlistController._internal();

  final List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  bool isFavorite(String productName) {
    return _wishlist.any((item) => item['name'] == productName);
  }

  void toggleWishlist(Map<String, dynamic> product) {
    if (isFavorite(product['name'])) {
      _wishlist.removeWhere((item) => item['name'] == product['name']);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }
}
