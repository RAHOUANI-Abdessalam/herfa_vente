import 'package:flutter/material.dart';
import 'package:herfa_vente/models/product.dart';

class Cart with ChangeNotifier {
  List<Product> _items = [];
  double _price = 0.0;

  void add(Product item){
    _items.add(item);
    notifyListeners();
    _price += item.price;
  }

    void remove(Product item){
    _items.remove(item);
    notifyListeners();
    _price -= item.price;
  }

  int get count {
    return _items.length;
  }

  double get totalprice{
    return _price;
  }
  
  List<Product> get addedProducts{
    return _items;
  }
}
