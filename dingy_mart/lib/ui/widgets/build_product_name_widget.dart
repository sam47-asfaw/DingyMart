import 'package:flutter/material.dart';

Widget buildProductNameWidget(String name, ThemeData theme){
    return  Container(
      height: 40,
      width: 200,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(left: 5.0),
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
      child: Text(
        name,
        style: theme.textTheme.headline5,
    ),
  );

}