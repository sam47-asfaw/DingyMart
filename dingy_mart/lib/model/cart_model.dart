import 'model.dart';

class CartModel{
  final String id;
  final String userId;
  String? productId;
  final double price;

  CartModel({
    required this.id,
    required this.userId,
     this.productId,
    required this.price,
});

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
        id: json['id'],
        productId: json['productId'],
        userId: json['userId'],
        price: json['totalPrice'],
    );

  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id.toString(),
    'productId': productId!.toString(),
    'userId' : userId.toString(),
    'price' : price,
  };

}