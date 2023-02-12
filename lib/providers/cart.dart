import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double s = 0.0;
    items.forEach((key, cartItem) {
      s += cartItem.price * cartItem.quantity;
    });
    return s;
  }

  void addItem(String productId, double price, String title) {
    if (_items == null) {
      _items.putIfAbsent(
          productId,
          (() => CartItem(
                id: DateTime.now().toString(),
                price: price,
                quantity: 1,
                title: title,
              )));
    } else if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCI) => CartItem(
              id: existingCI.id,
              price: existingCI.price,
              title: existingCI.title,
              quantity: existingCI.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          (() => CartItem(
                id: DateTime.now().toString(),
                price: price,
                quantity: 1,
                title: title,
              )));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
