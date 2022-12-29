import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_dao.dart';


class CartNotifier with ChangeNotifier {

  DingyMartDB dingyMartDB = DingyMartDB();

   late List<ProductModel> cart = [];

  int _counter = 0;

  int get counter => _counter;

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
  }

  void increaseCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void decreaseCounter() {
      if(_counter == 0){
        turnCounterToZero();
      }else{
        _counter--;
      }
    _setPrefsItems();
    notifyListeners();
  }

  void turnCounterToZero(){
    _counter = 0;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }

   //get cart
  Future<List<ProductModel>> getCartData() async {
    cart = (await dingyMartDB.getCart()).cast<ProductModel>();
    notifyListeners();
    return cart;
  }

  void addProductToCart({required ProductModel product}) {
    if(cart.contains(product)){
      cart.remove(product);
      decreaseCounter();
      cart.add(product);
      increaseCounter();
      notifyListeners();
    } else {
      cart.add(product);
      increaseCounter();
      notifyListeners();
    }
  }

  void removeProductFromCart(ProductModel product) {
      final index = cart.indexOf(product);
      cart.removeAt(index);
      notifyListeners();
    }


  void removeAllProductsFromCart(){
    cart.clear();
    dingyMartDB.deleteAllCartItem();
    notifyListeners();
  }

   double get total {
     return cart.fold(0.0, (double currentTotal, ProductModel nextProduct) {
       return currentTotal + nextProduct.price;
     });
   }

}