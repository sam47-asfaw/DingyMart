import 'package:flutter/material.dart';
import '../../app_theme.dart';

class UnRegisteredUserCartScreen extends StatelessWidget {
  const UnRegisteredUserCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/empty_cart_image/undraw_shopping_app.png';
    final theme = AppTheme.commonTheme();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildInfoDisplayContainer(assetName: assetName),
          const SizedBox(height: 5.0,),
          Text(
            'No items in Cart. \n Login to view cart',
            style: theme.textTheme.headline4,
          ),
          const SizedBox(height: 8.0,),
          _buildLoginButton(context: context, theme: theme),
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

  _buildLoginButton({required BuildContext context, required ThemeData theme}){
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 10.0,
      color: Colors.indigoAccent.shade100,
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        minWidth: 100,
        height: 50,
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Text(
          'Login To View Cart',
          style: theme.textTheme.headline5,
        ),
      ),
    );
  }
}
