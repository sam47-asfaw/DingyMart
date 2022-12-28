import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/user_dao.dart';


class CartNotifier with ChangeNotifier {

  DingyMartDB dingyMartDB = DingyMartDB();

   late List<ProductModel> cart = [];

   //get cart
  Future<List<ProductModel>> getCartData() async {
    cart = (await dingyMartDB.getCart()).cast<ProductModel>();
    notifyListeners();
    return cart;
  }

  void addProductToCart({required ProductModel product}) {
    if(cart.contains(product)){
      cart.remove(product);
    }
    cart.add(product);
    notifyListeners();
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