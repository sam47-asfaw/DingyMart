import 'dart:collection';
import '../../providers/notifiers.dart';
import '../../model/product_model.dart';
import 'common_widgets.dart';
import 'package:flutter/material.dart';

Widget onSaleProductsWidget(BuildContext context,
    ThemeData theme, double width, double height){
  UnmodifiableListView<ProductModel> onSaleProductsList = ProductNotifier().onSaleProducts;
  return commonSingleChildScrollView(
      context, onSaleProductsList, theme, height, width
  );
}