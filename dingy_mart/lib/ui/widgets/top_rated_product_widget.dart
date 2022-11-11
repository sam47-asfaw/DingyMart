import 'dart:collection';
import '../../providers/notifiers.dart';
import '../../model/product_model.dart';
import 'common_widgets.dart';
import 'package:flutter/material.dart';

Widget topRatedProductsWidget(BuildContext context,
    ThemeData theme, double width, double height) {
  UnmodifiableListView<ProductModel> topRatedProductsList = ProductNotifier()
      .topRatedProducts;
  return commonSingleChildScrollView(
      context, topRatedProductsList, theme, height, width
  );
}
