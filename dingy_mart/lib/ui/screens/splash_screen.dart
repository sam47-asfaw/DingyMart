import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/splashScreen/online_shopping_monochromatic.svg';
    return Scaffold(
            body:  Stack(
                       children:[
                       Flexible(
                         fit: FlexFit.tight,
                           child: SvgPicture.asset(
                            assetName,
                             alignment: Alignment.center,
                             fit: BoxFit.contain,
                           ),
                       ),
                     ],
                     ),
           );
  }
}
