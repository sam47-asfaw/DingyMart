
import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_dao.dart';


class WishListNotifier with ChangeNotifier {
  DingyMartDB dingyMartDB = DingyMartDB();

  final List<ProductModel> wishList = [];

  int _counter = 0;

  int get counter => _counter;

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('wishList_items', _counter);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('wishList_items') ?? 0;
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

  void addProductToWishList({required ProductModel product}){
    if(wishList.contains(product)){
      wishList.remove(product);
      decreaseCounter();
      wishList.add(product);
      increaseCounter();
      notifyListeners();
    } else {
      wishList.add(product);
      increaseCounter();
      notifyListeners();
    }
  }

  void removeProductFromWishList(ProductModel product) {
    final index = wishList.indexOf(product);
    wishList.removeAt(index);
    notifyListeners();
  }

  void removeAllProductsFromWishList(){
    wishList.clear();
    turnCounterToZero();
    notifyListeners();
  }

}