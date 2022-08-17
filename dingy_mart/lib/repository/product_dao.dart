import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';

class ProductDAO{

  CollectionReference collectionReference =  FirebaseFirestore.instance.collection('products');

  //get all products
  Stream<QuerySnapshot<Object?>> getAllProducts() {
    return collectionReference.snapshots();
  }

  //get accessories category products
Query<Object?> getAccessoriesProducts(){
    final accessoryProducts = collectionReference
        .where("category", isEqualTo: "accessories");
    return accessoryProducts;
}

//get onSale accessories products
Query<Object?> getOnSaleAccessoriesProducts(){
    final onSaleAccessoryProducts = collectionReference
        .where("category", isEqualTo: "accessories")
        .where("isOnSale", isEqualTo: "true");
    return onSaleAccessoryProducts;
  }

  //get TopRated accessories products
  Query<Object?> getTopRatedAccessoriesProducts(){
    final topRatedAccessoryProducts = collectionReference
        .where("category", isEqualTo: "accessories")
        .where("isTopRated", isEqualTo: "true");
    return topRatedAccessoryProducts;
  }

  //get recommended accessories products
  Query<Object?> getRecommendedAccessoriesProducts(){
    final recommendedAccessoryProducts = collectionReference
        .where("category", isEqualTo: "accessories")
        .where("isRecommended", isEqualTo: "true");
    return recommendedAccessoryProducts;
  }

  //get bottomWear category products
  Query<Object?> getBottomWearProducts(){
    final bottomWearProducts = collectionReference
        .where("category", isEqualTo: "bottomWear");
    return bottomWearProducts;
  }

//get onSale bottomWear products
  Query<Object?> getOnSaleBottomWearProducts(){
    final onSaleBottomWearProducts = collectionReference
        .where("category", isEqualTo: "bottomWear")
        .where("isOnSale", isEqualTo: "true");
    return onSaleBottomWearProducts;
  }

  //get TopRated bottomWear products
  Query<Object?> getTopRatedBottomWearProducts(){
    final topRatedBottomWearProducts = collectionReference
        .where("category", isEqualTo: "bottomWear")
        .where("isTopRated", isEqualTo: "true");
    return topRatedBottomWearProducts;
  }

  //get recommended bottomWear products
  Query<Object?> getRecommendedBottomWearProducts(){
    final recommendedBottomWearProducts = collectionReference
        .where("category", isEqualTo: "bottomWear")
        .where("isRecommended", isEqualTo: "true");
    return recommendedBottomWearProducts;
  }

  //get electronics category products
  Query<Object?> getElectronicsProducts(){
    final electronicsProducts = collectionReference.where("category", isEqualTo: "electronics");
    return electronicsProducts;
  }

//get onSale electronics products
  Query<Object?> getOnSaleElectronicsProducts(){
    final onSaleElectronicsProducts = collectionReference
        .where("category", isEqualTo: "electronics")
        .where("isOnSale", isEqualTo: "true");
    return onSaleElectronicsProducts;
  }

  //get TopRated electronics products
  Query<Object?> getTopRatedElectronicsProducts(){
    final topRatedElectronicsProducts = collectionReference
        .where("category", isEqualTo: "electronics")
        .where("isTopRated", isEqualTo: "true");
    return topRatedElectronicsProducts;
  }

  //get recommended bottomWear products
  Query<Object?> getRecommendedElectronicsProducts(){
    final recommendedElectronicsProducts = collectionReference
        .where("category", isEqualTo: "electronics")
        .where("isRecommended", isEqualTo: "true");
    return recommendedElectronicsProducts;
  }

  //get footwear category products
  Query<Object?> getFootWearProducts(){
    final footWearProducts = collectionReference.where("category", isEqualTo: "footWear");
    return footWearProducts;
  }

//get onSale footwear products
  Query<Object?> getOnSaleFootWearProducts(){
    final onSaleFootWearProducts = collectionReference
        .where("category", isEqualTo: "footWear")
        .where("isOnSale", isEqualTo: "true");
    return onSaleFootWearProducts;
  }

  //get TopRated footWear products
  Query<Object?> getTopRatedFootWearProducts(){
    final topRatedFootWearProducts = collectionReference
        .where("category", isEqualTo: "footWear")
        .where("isTopRated", isEqualTo: "true");
    return topRatedFootWearProducts;
  }

  //get recommended footWear products
  Query<Object?> getRecommendedFootWearProducts(){
    final recommendedFootWearProducts = collectionReference
        .where("category", isEqualTo: "footWear")
        .where("isRecommended", isEqualTo: "true");
    return recommendedFootWearProducts;
  }

  //get home category products
  Query<Object?> getHomeProducts(){
    final footWearProducts = collectionReference.where("category", isEqualTo: "home");
    return footWearProducts;
  }

//get onSale home products
  Query<Object?> getOnSaleHomeProducts(){
    final homeProducts = collectionReference
        .where("category", isEqualTo: "home")
        .where("isOnSale", isEqualTo: "true");
    return homeProducts;
  }

  //get TopRated home products
  Query<Object?> getTopRatedHomeProducts(){
    final topRatedHomeProducts = collectionReference
        .where("category", isEqualTo: "home")
        .where("isTopRated", isEqualTo: "true");
    return topRatedHomeProducts;
  }

  //get recommended home products
  Query<Object?> getRecommendedHomeProducts(){
    final recommendedHomeProducts = collectionReference
        .where("category", isEqualTo: "home")
        .where("isRecommended", isEqualTo: "true");
    return recommendedHomeProducts;
  }




}
