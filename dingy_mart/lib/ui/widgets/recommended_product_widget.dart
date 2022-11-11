import 'dart:collection';
import '../../providers/notifiers.dart';
import '../../model/product_model.dart';
import 'common_widgets.dart';
import 'package:flutter/material.dart';

Widget recommendedProductsWidget(BuildContext context,
    ThemeData theme, double width, double height) {
  UnmodifiableListView<ProductModel> recommendedProductsList = ProductNotifier()
      .recommendedProducts;
  return commonSingleChildScrollView(
      context, recommendedProductsList, theme, height, width
  );
}