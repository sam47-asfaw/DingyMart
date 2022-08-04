import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
      backgroundColor: Colors.indigo.shade50,
      type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo.shade600,
      unselectedItemColor: Colors.indigo.shade400,
        selectedLabelStyle: theme.textTheme.headline5,
        unselectedLabelStyle: theme.textTheme.headline6,

        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items:  [
          //Todo: Home navbar
           BottomNavigationBarItem(
             icon: Icon(
                       FeatherIcons.home,
                       size: theme.iconTheme.size,
                       color: theme.iconTheme.color,
                     ),
                    label: 'Home',
          ),

          //Todo: Categories navbar
           BottomNavigationBarItem(
            icon: Icon(
                  FeatherIcons.list,
                  size: theme.iconTheme.size,
                  color: theme.iconTheme.color,
                ),
               label: 'Categories',
           ),
          //Todo: cart navbar
           BottomNavigationBarItem(
            icon: Icon(
                  FeatherIcons.shoppingCart,
                  size: theme.iconTheme.size,
                  color: theme.iconTheme.color,
                ),
                label: 'MyCart',
          ),
          //Todo: Profile navbar
           BottomNavigationBarItem(
            icon: Icon(
                  UniconsLine.user_circle,
                  size: theme.iconTheme.size,
                  color: theme.iconTheme.color,
                ),
             label: 'Profile',
           ),
        ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );
  }
}
