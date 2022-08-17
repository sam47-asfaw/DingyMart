import 'model.dart';
class ProductModel{
  String? id;
  String? name;
  double? price;
  int? quantity;
  String? imgUrl;
  String? description;
  CategoryModel? category;
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
    this.isOnSale = false,
    this.isTopRated = false,
    this.isRecommended = false,
 });

  get getQuantity => quantity;

  set setQuantity(int quantity) =>  this.quantity = quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    price : json["price"].toDouble() ?? '',
    quantity: json["quantity"].toInt()?? '',
    imgUrl: json["imgUrl"] ?? '',
    description: json["description"] ?? '',
    category: json["category"]?? '',
    isOnSale: json["isOnSale"]?? '',
    isTopRated: json["isTopRated"]?? '',
    isRecommended: json["isRecommended"]?? '',
  );
  //
  // Map<String, dynamic> toJson() => <String, dynamic>{
  //   'id': id.toString(),
  //   'name': name.toString(),
  //   'price': price.toString(),
  // };
}