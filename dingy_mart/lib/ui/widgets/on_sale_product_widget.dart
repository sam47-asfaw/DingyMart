import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../model/product_model.dart';
import '../../repository/product_dao.dart';
import 'common_widgets.dart';
import 'package:flutter/material.dart';

Widget onSaleProductsWidget(BuildContext context,
    String category, ThemeData theme, double width, double height){

  final _future = Provider.of<ProductDAO>(context).getOnSaleCustomProducts(category: category);

  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>> (
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        QuerySnapshot querySnapshot = snapshot.data!;
        final List<QueryDocumentSnapshot> documents = querySnapshot.docs;
        List<ProductModel> onSaleProductsList = documents.map(
                (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)
        ).toList();
        return commonSingleChildScrollView(context, onSaleProductsList, theme, width, height);
      }
  );
}