import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


class ProductDAO{

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('products');

  //get all products
  Stream<QuerySnapshot<Object?>> getAllProducts() {
    final allProducts = collectionReference.snapshots();
    return allProducts;

  }

  Stream<List<ProductModel>> getCustomProducts([String? category]){
    final customProducts = collectionReference
        .snapshots()
        .map(
            (QuerySnapshot snapshot) =>
                snapshot.docs.map(
                    (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)

      )
                    .where((product) => product.category == category)
                    .toList()
    );
    return customProducts;
  }



  //get onSale custom category product
  Stream<List<ProductModel>> getOnSaleCustomProducts([String? category]) {
    final onSaleCustomProducts = collectionReference.
        where('category', isEqualTo: category)
        .where('isOnSale', isEqualTo: true)
    .snapshots()
        .map(
            (snapshot) => snapshot.docs.map(
                    (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)
            ).toList()
    );

    return onSaleCustomProducts;
  }

  //get topRated custom category product
  Stream<List<ProductModel>> getTopRatedCustomProducts([String? category]){
    final topRatedProducts = collectionReference.
    where('category', isEqualTo: category)
        .where('isTopRated', isEqualTo: true)
        .snapshots()
        .map(
            (snapshot) => snapshot.docs.map(
                (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)
        ).toList()
    );

    return topRatedProducts;
  }

  //get recommended custom category product
  Stream<List<ProductModel>> getRecommendedCustomProducts([String? category]){
    final recommendedProducts = collectionReference.
    where('category', isEqualTo: category)
        .where('isRecommended', isEqualTo: true)
        .snapshots()
        .map(
            (snapshot) => snapshot
                .docs
                .map(
                (doc) =>
                    ProductModel.fromJson(doc.data() as Map<String, dynamic>)
        ).toList()
    );

    return recommendedProducts;
  }

}
