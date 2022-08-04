import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/splashScreen/splash_screen.jpg';
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(assetName),
        ],
      ),
    );
  }
}
