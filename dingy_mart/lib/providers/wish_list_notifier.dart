
import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/user_dao.dart';


class WishListNotifier with ChangeNotifier {
  DingyMartDB dingyMartDB = DingyMartDB();

  final List<ProductModel> wishList = [];


  void addProductToWishList({required ProductModel product}){

    if(wishList.contains(product)){
      wishList.remove(product);
    }
    wishList.add(product);
    notifyListeners();
  }

  void removeProductFromWishList(ProductModel product) {
    final index = wishList.indexOf(product);
    wishList.removeAt(index);
    notifyListeners();
  }

  void removeAllProductsFromWishList(){
    wishList.clear();
    dingyMartDB.deleteAllWishListItem();
    notifyListeners();
  }

}