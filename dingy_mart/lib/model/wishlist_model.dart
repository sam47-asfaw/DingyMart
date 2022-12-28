import 'model.dart';

const String wishListTable = 'wish';

class WishListFields{

  static const String id = '_id';
  static const String userId = 'userId';
  static const String productId = 'productId';
  static const String title = 'title';
  static const String imgUrl = 'imgUrl';
}

class WishListModel{
  final String id;
  final String? userId;
  final String productId;
  final String title;
  final String imgUrl;

  WishListModel({
    required this.id,
    this.userId,
    required this.productId,
    required this.title,
    required this.imgUrl,
});

 factory WishListModel.fromJson(Map<String, dynamic> json){
    return WishListModel(
      id: json[WishListFields.id] as String ?? '',
      userId: json[WishListFields.userId] as String ?? '',
      productId: json[WishListFields.productId] as String ?? '',
      title: json[WishListFields.title] as String ?? '',
      imgUrl: json[WishListFields.imgUrl] as String ?? '',
    );
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    WishListFields.id : id.toString(),
    WishListFields.userId: userId,
    WishListFields.productId: productId,
    WishListFields.title : title,
    WishListFields.imgUrl: imgUrl,
  };
}