import 'model.dart';

class CartModel{
  UserModel user;
  List<ProductModel>? products;
  int quantity;
  double totalPrice;

  CartModel({
    required this.user,
    required this.quantity,
    required this.totalPrice,
});

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
        user: json['user'],
        quantity: json['quantity'],
        totalPrice: json['totalPrice'],
    );

  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'user': user.toString(),
    'products': products.toString(),
    'quantity': quantity.toString(),
    'totalPrice': totalPrice.toString(),
  };

}