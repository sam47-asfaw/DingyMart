import 'package:flutter/material.dart';

import '../../app_theme.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.commonTheme();
    String assetName = 'assets/splashScreen/splash_screen.jpg';
    return Scaffold(
            body: Center(
                child: Text(
                 'DingyMart',
                  style: theme.textTheme.headline1,
                ),
            ),
    );
  }
}
