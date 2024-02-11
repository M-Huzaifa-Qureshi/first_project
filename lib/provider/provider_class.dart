import 'package:flutter/cupertino.dart';

class huzaifa extends ChangeNotifier {
  final List<CardProduct> _cardItems = [];
  List<CardProduct> get carditems => _cardItems;

  void addtoCart(CardProduct item) {
    _cardItems.add(item);
    notifyListeners();
  }

  void removeCart(CardProduct item) {
    _cardItems.remove(item);
    notifyListeners();
  }

  double calculate() {
    return _cardItems.fold(0, (total, item) => total + item.price * item.quantity);
  }

  bool itemInCart(String title) {
    return _cardItems.any((item) => item.title == title);
  }

  void clearCart() {
    _cardItems.clear();
    notifyListeners();
  }
}

class CardProduct {
  String title;
  double price;
  int quantity;
  String imageUrl;

  CardProduct({
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
