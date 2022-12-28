import 'package:flutter/cupertino.dart';

import 'model.dart';

const String cartTable = 'cart';

class CartFields{
  static const String id = '_id';
  static const String userId = 'userId';
  static const String title = 'title';
  static const String imgUrl = 'imgUrl';
  static const String price = 'price';

}

class CartModel{
  final String id;
  final String? userId;
  final String title;
  final String imgUrl;
  final String price;

  CartModel({
     required this.id,
     this.userId,
    required this.title,
    required this.imgUrl,
    required this.price,
});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
     CartModel(
        id: json[CartFields.id] as String?? '',
        userId: json[CartFields.userId] as String?? '',
        title: json[CartFields.title] as String ?? '',
        imgUrl: json[CartFields.imgUrl] as String ?? '',
        price: json[CartFields.price] as String ?? '',
    );

  Map<String, dynamic> toJson() => <String, dynamic>{
    CartFields.id: id,
    CartFields.userId: userId,
    CartFields.title: title,
    CartFields.imgUrl: imgUrl,
    CartFields.price : price.toString(),
  };

}