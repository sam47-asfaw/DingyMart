import 'model.dart';

class WishListModel{
  final String id;
  List<ProductModel>? products;
  final String userId;

  WishListModel({
    required this.id,
    required this.userId,
    required this.products,
});

 factory WishListModel.fromJson(Map<String, dynamic> json){
    return WishListModel(
      id: json['id'],
      userId: json['userId'],
      products: json['products'],
    );
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id' : id.toString(),
    'userId' : userId,
    'productId': products!.toList(),
  };
}