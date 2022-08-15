import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/model/model.dart';

class ProductDAO{

  //read all products
   Future<List<ProductModel>> getAllProducts() async {
    return (
        await FirebaseFirestore.instance.collection('products').get())
        .docs
        .map((item) => ProductModel.fromJson(item.data()))
        .toList();
  }

}
