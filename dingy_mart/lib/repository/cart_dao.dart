import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/foundation.dart';

class CartDAO{

//get products from firestore collection cart
  getProductFromCart() async{
   final cartProductsReference = await FirebaseFirestore.instance.collection('products').get();
    return cartProductsReference;
 }

}