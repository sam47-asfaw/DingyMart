import 'package:dingy_mart/db/dingy_mart_db.dart';
import 'package:dingy_mart/providers/cart_notifier.dart';
import 'package:dingy_mart/ui/screens/screens.dart';
import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
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
  DingyMartDB dingyMartDB = DingyMartDB();

  @override
  void initState() {
    super.initState();
    context.read<CartNotifier>().getCartData();
  }

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
            TextButton(
                onPressed: (){
                  context.read<CartNotifier>().removeAllProductsFromCart();
                  context.read<CartNotifier>().turnCounterToZero();
                  showSnackBar(context, 'All products removed from Cart');
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
        body: Consumer<CartNotifier>(
          builder:  (BuildContext context, cart,  child){
            if (cart.cart.isEmpty) {
              return Center(
                child: Text(
                  'No products in Cart',
                  style: theme.textTheme.headline5,
                ),
              );
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:[
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                          final product = cart.cart[index];
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              setState(() {
                                dingyMartDB.deleteCartItem(product.id);
                                context.read<CartNotifier>()
                                    .removeProductFromCart(product);
                                context.read<CartNotifier>().decreaseCounter();
                              });
                              showSnackBar(
                                  context, 'Product removed from Cart');
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 2.0,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
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
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            product.name ?? '',
                                            style: theme.textTheme.headline5,
                                          ),
                                          const SizedBox(height: 16.0,),
                                          Text(
                                            product.price.toString() + '\$' ??
                                                '',
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'TOTAL: ${context.select((CartNotifier cart) => cart.total)}',
                            style: theme.textTheme.headline3,
                          ),
                          const SizedBox(width: 8.0,),
                          _buyProductsButton(
                            context: context,
                            color: Colors.yellow.shade500,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartCheckOutScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Proceed to Buy',
                              style: theme.textTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
            );
          },
        ),
    );
  }

  Widget _buyProductsButton({
    required BuildContext context,
    required Color color,
    required VoidCallback onPressed,
    required Widget child,
  }){
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
       onPressed: onPressed,
         child: child,
        ),
    );
  }
}