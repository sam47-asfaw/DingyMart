import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app_theme.dart';

class CommonAppBar extends AppBar{
  CommonAppBar(
  BuildContext context,
      ThemeData themeData,
      {Key? key}
  ) :super(
        key: key,
        foregroundColor: themeData.appBarTheme.foregroundColor,
      backgroundColor: themeData.appBarTheme.backgroundColor,
      elevation: themeData.appBarTheme.elevation,
      title: Text(
        'DingyMart',
          style: themeData.textTheme.headline2,
      ),
    actions: [
      IconButton(
         icon: Icon(
             FeatherIcons.star,
           size: themeData.iconTheme.size,
           color:  themeData.iconTheme.color,
         ),
        onPressed: (){
          Navigator.pushNamed(context, '/wishList');
        },
      ),
    ],
  );
}
