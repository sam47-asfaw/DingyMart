import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';

class WishListDAO{


//get products from firestore wishlist collection

  getProductFromWishList() async{
    final wishListProducts = await FirebaseFirestore.instance.collection('wishList').get();
    return wishListProducts;
  }

}