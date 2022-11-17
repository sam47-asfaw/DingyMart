import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';

class ProductDAO{

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('products');

  //get all products
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
    final allProducts = FirebaseFirestore.instance.collection('products')
        .get();
    return allProducts;

  }

  //get onSale custom category product
  Future<QuerySnapshot<Map<String, dynamic>>> getOnSaleCustomProducts({required String category}) {
    final onSaleCustomProducts = FirebaseFirestore.instance.collection('products')
        .where('category', isEqualTo: category)
        .where('isOnSale', isEqualTo: true)
        .get();
    return onSaleCustomProducts;
  }

  //get topRated custom category product
  Future<QuerySnapshot<Map<String, dynamic>>> getTopRatedCustomProducts({required String category}){
    final topRatedProducts =FirebaseFirestore.instance.collection('products')
        .where('category', isEqualTo: category)
        .where('isTopRated', isEqualTo: true)
        .get();
    return topRatedProducts;
  }

  //get recommended custom category product
  Future<QuerySnapshot<Map<String, dynamic>>> getRecommendedCustomProducts({required String category}){
    final recommendedProducts = FirebaseFirestore.instance.collection('products')
        .where('category', isEqualTo: category)
        .where('isRecommended', isEqualTo: true)
        .get();
    return recommendedProducts;
  }
}
