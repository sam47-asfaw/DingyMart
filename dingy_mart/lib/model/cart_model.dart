import 'model.dart';

class CartModel{
  final String id;
  final String userId;
  String? productId;
  final double totalPrice;

  CartModel({
    required this.id,
    required this.userId,
     this.productId,
    required this.totalPrice,
});

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
        id: json['id'],
        productId: json['productId'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
    );

  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id.toString(),
    'productId': productId!.toString(),
    'userId' : userId.toString(),
    'totalPrice' : totalPrice,
  };

}