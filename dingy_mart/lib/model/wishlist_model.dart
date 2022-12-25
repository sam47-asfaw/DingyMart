import 'model.dart';

class WishListModel{
  final String id;
  final String title;
  final String imgUrl;

  WishListModel({
    required this.id,
    required this.title,
    required this.imgUrl,
});

 factory WishListModel.fromJson(Map<String, dynamic> json){
    return WishListModel(
      id: json['id'],
      title: json['userId'] ?? '',
      imgUrl: json['products'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id' : id.toString(),
    'title' : title,
    'imgUrl': imgUrl,
  };
}