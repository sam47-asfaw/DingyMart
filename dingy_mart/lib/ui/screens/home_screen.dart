import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/common_appbar.dart';
import '../widgets/common_bottom_navbar.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  final ThemeData theme = AppTheme.commonTheme();
    HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: CommonAppBar(context,theme ),
        bottomNavigationBar: const CommonBottomNavBar(),
      ),
    );
  }
}
