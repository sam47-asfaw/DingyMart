import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

class ProductModel{
  String? id;
  String? name;
  double? price;
  int? quantity;
  String? imgUrl;
  String? description;
  String? category;
  bool? isOnSale;
  bool? isTopRated;
  bool? isRecommended;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.imgUrl,
    this.description,
    this.category,
    this.isOnSale,
    this.isTopRated,
    this.isRecommended,
 });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    name: json["name"] ?? '',
    price : double.tryParse(json["price"]) ?? 0.0,
    quantity: int.tryParse(json["quantity"]) ?? 1,
    imgUrl: json["imgUrl"] ?? '',
    description: json["description"] ?? '',
    category:  json["category"] ?? '',
    isOnSale: json["isOnSale"] ?? true,
    isTopRated: json["isTopRated"]  ?? true,
    isRecommended: json["isRecommended"] ?? true,
  );
}