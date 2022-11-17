import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/repository/product_dao.dart';
import 'package:provider/provider.dart';
import '../../model/product_model.dart';
import 'common_widgets.dart';
import 'package:flutter/material.dart';

Widget allProductDisplayWidget(BuildContext context, ThemeData theme, double width, double height) {

  final _future = Provider.of<ProductDAO>(context).getAllProducts();

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
        List<ProductModel> allProductsList = documents.map(
                (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)
        ).toList();
        return commonSingleChildScrollView(context, allProductsList, theme, width, height);
      }
  );
}