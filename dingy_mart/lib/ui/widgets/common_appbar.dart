import 'package:badges/badges.dart';
import 'package:dingy_mart/providers/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    Badge(
    badgeColor: Colors.white,
    badgeContent: Consumer<WishListNotifier>(
      builder: (context, wish, child) {
        return Text(
          wish.getCounter().toString(),
          style: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w900,
            color: Colors.red.shade400,
          ),
        );
      },
    ),
    position: const BadgePosition(start: 30, bottom: 30),
    child:
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
