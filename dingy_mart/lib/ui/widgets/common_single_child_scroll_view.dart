import 'package:dingy_mart/ui/widgets/common_card_grid.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';

Widget commonSingleChildScrollView(
    BuildContext context,
    List<ProductModel> products,
    ThemeData theme, double width, double height) {
     return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                //reverse: true,
                primary: true,
                child: commonCardGrid(
                    context, products, theme, height, width
                ),

  );

}