import 'package:dingy_mart/providers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:dingy_mart/model/model.dart';

import '../../app_theme.dart';

class CartCheckOutScreen extends StatelessWidget {
  //final List<ProductModel> cart;
  const CartCheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.commonTheme();
    final cart = Provider.of<CartNotifier>(context);
    return  Scaffold(
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
          'Order Detail',
          style: theme.textTheme.headline3,
        ),
      ),
      body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
              Expanded(
               child:  ListView.builder(
                itemCount: cart.cart.length,
                itemBuilder: (BuildContext context, int index){
                final product = cart.cart[index];
                  return  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 2.0,
                        shadowColor: const Color.fromARGB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)
                        ),
                        child: Image(
                          image: NetworkImage(product.imgUrl),
                          width: 300,
                          height: 200,
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text(
                        product.name,
                        style: theme.textTheme.headline3,
                      ),
                    ],
                  );
               },
             ),
             ),
              const Divider(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'TOTAL: ${context.select((CartNotifier cart) => cart.total)} \$',
                  style: theme.textTheme.headline3,
                ),
              )
            ],
        ),

       );
         }
}
