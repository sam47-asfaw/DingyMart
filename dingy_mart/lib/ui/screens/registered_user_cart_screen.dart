import 'package:dingy_mart/providers/cart_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import '../../app_theme.dart';
import '../../model/model.dart';


class CartScreen extends StatefulWidget {

  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final theme = AppTheme.commonTheme();

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
            context.watch<UserModel>().getGeneratedUserName( context.watch<User>().email!) + ' Cart',
            style: theme.textTheme.headline5,
          ),
          centerTitle: true,
          actions: [
            TextButton.icon(
                onPressed: (){
                  context.read<CartNotifier>().removeAllProductsFromCart();
                },
                icon: const Icon(
                  UniconsLine.trash_alt,
                  color: Colors.red,
                  size: 14.0,
                ),
                label: Text(
                    'Remove all',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
            ),
          ],
        ),
        body: Consumer<CartNotifier>(
          builder:  (BuildContext context, CartNotifier cart, Widget? child){
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:[
                  Expanded(
                    child: ListView.builder(
                        //shrinkWrap: true,
                      itemCount: cart.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (cart.cart.isEmpty) {
                          return Center(
                            child: Text(
                              'No products in cart',
                              style: theme.textTheme.headline5,
                            ),
                          );
                        }
                        final product = cart.cart[index];
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              context.read<CartNotifier>().removeProductFromCart(
                                  product);
                            });
                          },
                          child: Card(
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
                                    ],
                                ),
                              ),
                            ),
                          );
                          }
                         ),
                        ),
                    const Divider(),
                  Align(
                      alignment: Alignment.center,
                    child: Text(
                      'TOTAL: ${context.select((CartNotifier cart) => cart.total)}',
                      style: theme.textTheme.headline3,
                    ),
                  )
                ],
            );
          },
        ),
    );
  }
}