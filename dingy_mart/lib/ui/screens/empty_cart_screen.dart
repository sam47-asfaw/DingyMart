import 'package:flutter/material.dart';

import '../../app_theme.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/empty_cart_image/undraw_shopping_app.png';
    final theme = AppTheme.commonTheme();
    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
          flex: 2,
          child:   _buildInfoDisplayContainer(assetName: assetName),

        ),
          const SizedBox(height: 5.0,),
          Text(
          'No items in Cart.',
          style: theme.textTheme.headline4,
          ),
          ],
        ),
    );
  }

_buildInfoDisplayContainer({required String assetName}){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.cover
      ),
    ),
  );
}
}
