
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';


class CartNotifier extends ChangeNotifier {

  final Map<String, CartModel> _item = {};

  Map<String, CartModel> get item => _item;



  void addProductToCart({required ProductModel product, required UserModel user, required double price}){
    final cartDocRefernce = FirebaseFirestore.instance.collection('cart').doc();

    if(_item.containsKey(product.id)){
      _item.update(
          product.id, (value) =>
       CartModel(
        id: value.id,
        userId: value.userId,
          productId: value.productId,
          price: value.price,
        ));
      cartDocRefernce.set(_item);
      notifyListeners();
    } else{
      _item.putIfAbsent(product.id, () => CartModel(
        id: DateTime.now().toString(),
        userId: user.id.toString(),
        productId: product.id.toString(),
        price: price,
      ));
      cartDocRefernce.set(_item);
      notifyListeners();
    }
  }

  void removeProdcutsFromCart(){
    _item.clear();
    notifyListeners();
}

   double get totalPrice {
    double totalPrice = 0.0;
    _item.forEach((key, product) {
      totalPrice += product.price;
    });
    return totalPrice;
  }


}