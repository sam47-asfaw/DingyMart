import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';


class CartNotifier with ChangeNotifier {
   List<ProductModel> _cart = [];

  List<ProductModel> get cart => _cart;

  double get total {
    return _cart.fold(0.0, (double currentTotal, ProductModel nextProduct) {
      return currentTotal + nextProduct.price;
    });
  }

  void addProductToCart({required ProductModel product}) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProductFromCart(ProductModel product) {
    _cart.remove(product);
    notifyListeners();
  }

  void removeAllProductsFromCart(){
    _cart.clear();
    notifyListeners();
  }

}