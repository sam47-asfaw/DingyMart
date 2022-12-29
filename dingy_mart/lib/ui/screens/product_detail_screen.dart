import 'package:dingy_mart/app_theme.dart';
import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:dingy_mart/ui/screens/order_detail_screen.dart';
import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:dingy_mart/providers/notifiers.dart';

import '../../repository/user_dao.dart';

class ProductDetailScreen extends StatelessWidget {

   const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    final theme = AppTheme.commonTheme();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wishList = Provider.of<WishListNotifier>(context);

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
        centerTitle: true,
        title: Text(
          product.name,
          style: theme.textTheme.headline3,
        ),
        actions: [
          IconButton(
            icon: Icon(
              FeatherIcons.star,
              size: theme.iconTheme.size,
              color:  theme.iconTheme.color,
            ),
            onPressed: (){
              context.read<WishListNotifier>().addProductToWishList(product: product,);
              showSnackBar(context, 'Product added to WishList');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildProductContainer(width: width, height: height),
           _buildProductDescriptionWidget(
                context: context,
                theme: theme,
                title: product.name,
                price: product.price.toString(),
                description: product.description
            ),

          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildBuyButtonWidget(
                product: product,
                context: context,
               routeName: '/order',
               color: Colors.yellow.shade500,
                child: Center(
                        child: Text(
                          'Buy',
                        style: theme.textTheme.headline4,
                        ),
                      ),
                    ),
              const SizedBox(width: 6.0,),

              _buildCartButtonWidget(
                product: product,
                productId: product.id,
                price: product.price.toDouble(),
                context: context,
                routeName: '/cart',
                color: Colors.blue.shade50,
                child: Row (
                  children: [
                    Text(
                      'Add To Cart',
                      style: theme.textTheme.headline4,
                    ),
                    Icon(
                      FeatherIcons.shoppingCart,
                      size: 20,
                      color: theme.iconTheme.color,
                    ),
                  ],
                ),
              ),
               ],
              ),
        ],
      ),

    );
  }

  //product image container widget
   _buildProductContainer({required double width, height}){
     return  Container(
       width: width,
       height: height / 2,
       margin: const EdgeInsets.symmetric(
         vertical: 8.0,
         horizontal: 10,
       ),
       decoration: BoxDecoration(
         color: Colors.white,
         image: DecorationImage(
             image: NetworkImage(product.imgUrl),
             fit: BoxFit.cover
         ),

         borderRadius: BorderRadius.circular(8.0),
         border: Border(
           top: BorderSide(
             color: Colors.indigo.shade50,
             width: 1.0,
           ),
           left: BorderSide(
             color: Colors.indigo.shade50,
             width: 1.0,
           ) ,
           right: BorderSide(
             color: Colors.indigo.shade50,
             width: 1.0,
           ) ,
           bottom: BorderSide(
             color: Colors.indigo.shade50,
             width: 1.0,
           ) ,
         ),
         boxShadow: [
           BoxShadow(
             color: Colors.indigo.shade50.withOpacity(0.5),
             spreadRadius: 5,
             blurRadius: 7,
             offset: const Offset(0, 3), // changes position of shadow
           ),
         ],
       ),
     );

   }

   //product name and description widget
   _buildProductDescriptionWidget({
     required BuildContext context,
     required ThemeData theme,
     required String title, price, description,
   }) {
     return Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         mainAxisSize: MainAxisSize.max,
         children: [
           Container(
             width: 280,
             height: 50,
             margin: const EdgeInsets.symmetric(
               vertical: 8.0,
               horizontal: 10,
             ),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(8.0),
               border: Border(
                 top: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ),
                 left: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
                 right: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
                 bottom: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.indigo.shade50.withOpacity(0.5),
                   spreadRadius: 5,
                   blurRadius: 7,
                   offset: const Offset(0, 3), // changes position of shadow
                 ),
               ],
             ),
             child: Row(
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                   Text(
                     title,
                     style: theme.textTheme.headline5,
                     overflow: TextOverflow.ellipsis,
                   ),
                 Text(
                   price + '\$',
                   style: theme.textTheme.headline4,
                   overflow : TextOverflow.ellipsis,
                 ),
               ],
             ),
           ),
           Container(
             width: 280,
             height: 80,
             margin: const EdgeInsets.symmetric(
               vertical: 8.0,
               horizontal: 10,
             ),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(8.0),
               border: Border(
                 top: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ),
                 left: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
                 right: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
                 bottom: BorderSide(
                   color: Colors.indigo.shade50,
                   width: 1.0,
                 ) ,
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.indigo.shade50.withOpacity(0.5),
                   spreadRadius: 5,
                   blurRadius: 7,
                   offset: const Offset(0, 3), // changes position of shadow
                 ),
               ],
             ),
               child: Center(
                 child: Text(
                   description,
                   style: theme.textTheme.headline6,
                   softWrap: true,
                   textAlign: TextAlign.center,
                 ),
               ),
           ),
         ],
     );
   }

   //buy button

   _buildBuyButtonWidget({
         required BuildContext context,
         required String routeName,
         required Color color,
         required Widget child,
        required ProductModel product,
       }
       ){
     return Material(
       shape: RoundedRectangleBorder(
         borderRadius:BorderRadius.circular(10.0),
       ),
       elevation: 16.0,
       color: color,
       clipBehavior: Clip.antiAlias,
       child: MaterialButton(
         minWidth: 100,
         height: 50,
         onPressed: () {
           Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => OrderDetailScreen(product: product),
             ),
           );
         },
         child: child,
       ),
     );

   }

   // cart button widget
  _buildCartButtonWidget(
      {
        required String productId,
       required double price,
       required BuildContext context,
      required String routeName,
      required Color color,
      required Widget child,
        required ProductModel product,
  })
  {
    final cart = Provider.of<CartNotifier>(context);
    final userId = Provider.of<UserDAO>(context).userId();
    DingyMartDB dingyMartDB = DingyMartDB();
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10.0),
      ),
      elevation: 16.0,
      color: color,
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        minWidth: 100,
        height: 50,
          onPressed: () {
            dingyMartDB.insertIntoCart(
               userId!,
              product.id,
              product,
            );
            cart.addProductToCart(
              product: product,
            );
            showSnackBar(context, 'Product added to Cart');
           // }
          },
          child: child,
      ),
    );
  }

}

