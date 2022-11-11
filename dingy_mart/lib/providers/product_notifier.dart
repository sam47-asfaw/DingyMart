import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:dingy_mart/repository/repository.dart';

class ProductNotifier with ChangeNotifier {

List<ProductModel> _onSaleProducts = [];
List<ProductModel> _topRatedProducts = [];
List<ProductModel> _recommendedProducts = [];

late ProductDAO _productDAO;
String? category;

UnmodifiableListView<ProductModel> get onSaleProducts => UnmodifiableListView(_onSaleProducts);
UnmodifiableListView<ProductModel> get topRatedProducts => UnmodifiableListView(_topRatedProducts);
UnmodifiableListView<ProductModel> get recommendedProducts => UnmodifiableListView(_recommendedProducts);

  void onSaleProductList(){
   final query = _productDAO.getOnSaleCustomProducts(category);
   query.map(
           (productList) => productList.map(
                   (product) => _onSaleProducts.add(product)
           )
   );
  notifyListeners();
}

void topRatedProductList(){
  final query = _productDAO.getTopRatedCustomProducts(category);
  query.map(
          (productList) => productList.map(
              (product) => _topRatedProducts.add(product)
      )
  );
 notifyListeners();
 }

 void recommendedProductList(){
  final query = _productDAO.getRecommendedCustomProducts(category);
  query.map(
          (productList) => productList.map(
              (product) => _recommendedProducts.add(product)
      )
  );
  notifyListeners();
 }

}