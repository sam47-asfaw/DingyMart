import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/providers/notifiers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import '../../app_theme.dart';
import '../../model/model.dart';
import '../widgets/common_snackbar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final theme = AppTheme.commonTheme();
 DingyMartDB dingyMartDB = DingyMartDB();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.appBarTheme.foregroundColor,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.indigo,
              iconSize: theme.iconTheme.size,
              icon: const Icon(UniconsLine.arrow_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            );
          },
        ),
        title: Text(
          context.watch<UserModel>().getGeneratedUserName( context.watch<User>().email!) + ' WishList',
          style: theme.textTheme.headline5,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (){
                context.read<WishListNotifier>().removeAllProductsFromWishList();
                context.read<WishListNotifier>().turnCounterToZero();
                showSnackBar(context, 'All products removed from WishList');
              },
              child: Text(
                'Remove all',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.red,
                ),
              )
          ),
        ],
      ),
      body: Consumer<WishListNotifier>(
        builder:  (BuildContext context, WishListNotifier wish, Widget? child){
          if (wish.wishList.isEmpty) {
            return  Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/empty_cart_image/undraw_shopping_app.png',
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 16.0,),
                Center(
                  child: Text(
                    'Your WishList is empty',
                    style: theme.textTheme.headline4,
                  ),
                ),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
              Expanded(
                child: ListView.builder(
                  //shrinkWrap: true,
                    itemCount: wish.wishList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = wish.wishList[index];
                      return Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  width: width / 5,
                                  height: height / 5,
                                  image: NetworkImage(product.imgUrl),
                                ),
                                const SizedBox(width: 24.0,),
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        product.name ?? '',
                                        style: theme.textTheme.headline5,
                                      ),
                                      const SizedBox(height: 16.0,),
                                      Text(product.price.toString() + '\$' ?? '',
                                        style: theme.textTheme.headline5,
                                      ),
                                    ],
                                  ),
                                ),
                             IconButton(
                              onPressed: () {
                                context.read<WishListNotifier>().removeProductFromWishList(product);
                                wish.decreaseCounter();
                                showSnackBar(context, 'Product removed from WishList');
                               },
                               icon: const Icon(
                                   FeatherIcons.trash2,
                                 color: Colors.red,
                                 size: 30.0,
                               ),
                             ),
                              ],
                            ),
                          ),
                      );
                    }
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
