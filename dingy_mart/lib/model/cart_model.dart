import 'model.dart';

class CartModel{
  final String id;
  final String title;
  final String imgUrl;
  final String price;
  final int quantity;

  CartModel({
     required this.id,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.quantity,
});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
     CartModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        imgUrl: json['imgUrl'] ?? '',
        price: json['price'] ?? '',
        quantity: json['quantity'] ?? 1,
    );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id.toString(),
    'title': title,
    'imgUrl': imgUrl,
    'price' : price.toString(),
    'quantity': quantity,
  };

}