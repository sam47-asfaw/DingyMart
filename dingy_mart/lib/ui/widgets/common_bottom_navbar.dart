import 'package:badges/badges.dart';
import 'package:dingy_mart/providers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import '../../app_theme.dart';

class CommonBottomNavBar extends StatefulWidget {
  const CommonBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  int _selectedIndex = 0;
  final theme = AppTheme.commonTheme();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo.shade600,
      unselectedItemColor: Colors.indigo.shade400,
        selectedLabelStyle: theme.textTheme.headline5,
        unselectedLabelStyle: theme.textTheme.headline6,

        showUnselectedLabels: true,
        items:  [
          //Todo: Home navbar
           BottomNavigationBarItem(
             icon: IconButton(
                icon: Icon(
                  FeatherIcons.home,
                       size: theme.iconTheme.size,
                       color: theme.iconTheme.color,
                    ),
               onPressed: () {
                  Navigator.pushNamed(context, '/');
               },
             ),
                    label: 'Home',
          ),

          //Todo: Categories navbar
           BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                UniconsLine.list_ul,
                size: theme.iconTheme.size,
                color: theme.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
            ),
               label: 'Categories',
           ),
          //Todo: cart navbar
           BottomNavigationBarItem(
            icon: Badge(
              badgeColor: Colors.white,
              badgeContent: Consumer<CartNotifier>(
                builder: (context, cart, child) {
                  return Text(
                    cart.getCounter().toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.red.shade400,
                    ),
                  );
                },
              ),
              position: const BadgePosition(start: 30, bottom: 30),
              child: IconButton(
                icon: Icon(
                  FeatherIcons.shoppingCart,
                  size: theme.iconTheme.size,
                  color: theme.iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ),
             label: 'MyCart',
            ),

          //Todo: Profile navbar
           BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                UniconsLine.user_circle,
                size: theme.iconTheme.size,
                color: theme.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
             label: 'Profile',
           ),
        ],
    );
  }

}
