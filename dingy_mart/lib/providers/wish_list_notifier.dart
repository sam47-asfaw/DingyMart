
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';


class WishListNotifier with ChangeNotifier {
  final List<ProductModel> _wishList = [];

  List<ProductModel> get wishList => _wishList;



  void addProductToWishList({required ProductModel product}) {
    _wishList.add(product);
    notifyListeners();
  }

  void removeProductFromWishList(ProductModel product) {
    _wishList.remove(product);
    notifyListeners();
  }

  void removeAllProductsFromWishList(){
    _wishList.clear();
    notifyListeners();
  }

}