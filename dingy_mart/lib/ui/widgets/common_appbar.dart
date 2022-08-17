import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../app_theme.dart';

class CommonAppBar extends AppBar{

  CommonAppBar(
  BuildContext context,
      ThemeData theme,
      {Key? key}
  ) :super(
        key: key,
        foregroundColor: theme.appBarTheme.foregroundColor,
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation,
      leadingWidth: double.infinity,
      leading: Center(
        child: Text(
          'DingyMart',
            style: theme.textTheme.headline2,
        ),
      ),
    actions: [
          IconButton(
            icon: Icon(
              FeatherIcons.star,
              size: theme.iconTheme.size,
              color:  theme.iconTheme.color,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/wish');
            },
          ),
          IconButton(
            icon: Icon(
              FeatherIcons.search,
              size: theme.iconTheme.size,
              color: theme.iconTheme.color,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/search' );
            },
          ),
        ],
  );
}
