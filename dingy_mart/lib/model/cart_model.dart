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
}