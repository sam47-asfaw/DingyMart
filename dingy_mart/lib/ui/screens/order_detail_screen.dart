import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:unicons/unicons.dart';
import 'package:dingy_mart/providers/notifiers.dart';

class OrderDetailScreen extends StatelessWidget {
  final ProductModel product;
  const OrderDetailScreen({Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.commonTheme();
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                const Divider(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'TOTAL Price: ${product.price} \$',
                    style: theme.textTheme.headline3,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
