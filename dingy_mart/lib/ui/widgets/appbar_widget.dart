import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

Widget appbarWidget(BuildContext context, String title, ThemeData theme){
  return AppBar(
    foregroundColor: theme.appBarTheme.foregroundColor,
    backgroundColor: theme.appBarTheme.backgroundColor,
    elevation: theme.appBarTheme.elevation,
    title: Text(
      title,
      style: theme.textTheme.headline2,
    ),
    actions: [
      IconButton(
        icon: Icon(
          FeatherIcons.star,
          size: theme.iconTheme.size,
          color:  theme.iconTheme.color,
        ),
        onPressed: (){
          Navigator.pushNamed(context, '/wishList');
        },
      ),
    ],
  );
}