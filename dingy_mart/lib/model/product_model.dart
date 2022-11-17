
class ProductModel{
  final String category;
  final String description;
  final String imgUrl;
  final bool isOnSale;
  final bool isRecommended;
  final bool isTopRated;
  final String name;
  final int price;
  final int quantity;
  String? id;

  ProductModel({
    required this.category,
    required this.description,
    required this.imgUrl,
    required this.isOnSale,
    required this.isRecommended,
    required this.isTopRated,
    required this.name,
    required this.price,
    required this.quantity,
    this.id,
 });

   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    name: json["name"]?? '',
    price : json['price'].ceil() ?? 0,
    quantity: json["quantity"] ?? 1,
    imgUrl: json["imgUrl"]?? '',
    description: json["description"]?? '',
    category:  json["category"]?? '',
    isOnSale: json["isOnSale"]?? true,
    isTopRated: json["isTopRated"]?? true,
    isRecommended: json["isRecommended"]?? true,
  );
}