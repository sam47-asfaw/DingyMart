import 'package:dingy_mart/app_theme.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unicons/unicons.dart';

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
              Navigator.pushNamed(context, '/wish');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildProductContainer(width: width, height: height),

          const SizedBox(
            height: 4.0,
          ),

           _buildProductDescriptionWidget(
                context: context,
                theme: theme,
                title: product.name,
                price: product.price.toString(),
                description: product.description
            ),

          const SizedBox(
            height: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildButtonWidget(
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
              const SizedBox(width: 12.0,),
              _buildButtonWidget(
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
                     style: theme.textTheme.headline3,
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
                 overflow: TextOverflow.ellipsis,

               ),
             ),
           ),
         ],
     );
   }

   // buy and cart button widget
  _buildButtonWidget({
    required BuildContext context,
    required String routeName,
    required Color color,
    required Widget child,
  })
  {
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
            Navigator.pushNamed(context, routeName);
          },
          child: child,
      ),
    );
  }

}

