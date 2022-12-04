import 'package:flutter/material.dart';

Widget buildProductPriceWidget(String price, ThemeData theme){
  return Container(
      height: 40,
      width: 80,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.indigo.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:
      Row(
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