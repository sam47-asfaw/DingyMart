import 'model.dart';
class ProductModel{
  String id;
  String name;
  double price;
  int quantity;
  String imgUrl;
  String description;
  CategoryModel category;
  bool isOnSale;
  bool isTopRated;
  bool isRecommended;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imgUrl,
    required this.description,
    required this.category,
    this.isOnSale = false,
    this.isTopRated = false,
    this.isRecommended = false,
 });

  get getQuantity => quantity;

  set setQuantity(int quantity) =>  this.quantity = quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"] as String,
    price : json["price"].toDouble(),
    quantity: json["quantity"].toInt(),
    imgUrl: json["imgUrl"] as String,
    description: json["description"] as String,
    category: json["category"],
    isOnSale: json["isOnSale"],
    isTopRated: json["isTopRated"],
    isRecommended: json["isRecommended"],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id.toString(),
    'name': name.toString(),
    'price': price.toString(),

  };
}