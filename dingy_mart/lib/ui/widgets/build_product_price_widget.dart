import 'package:flutter/material.dart';

Widget buildProductPriceWidget(String price, ThemeData theme){
  return Container(
      decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(5.0),
  ),
   child: Row(
     children: [
       Text(
         price,
       style: theme.textTheme.headline5,
       ),
       Text(
         '\$',
         style: theme.textTheme.headline5,
       ),
     ],
   ),
  );
}