import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import '../../app_theme.dart';
import '../../model/product_model.dart';
import '../../repository/product_dao.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final theme = AppTheme.commonTheme();
  List searchResult = [];

  void searchFromFireStore(String productName) async{
    final result = await  FirebaseFirestore.instance.collection('products')
        .where('name', isEqualTo: productName)
        .get();
    setState(() {
      searchResult = result.docs.map(
              (doc) => ProductModel.fromJson(doc.data())
      ).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
          title: SizedBox(
           width: MediaQuery.of(context).size.width,
              height:50,
              child:  TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      UniconsLine.search_alt,
                      color: Colors.indigo.shade100,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          color: Colors.indigo.shade50,
                          width: 2
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          color: Colors.indigo.shade400,
                          width: 2
                      ),
                    ),
                    label: Text(
                      'Search for product',
                      style: theme.textTheme.headline6,
                    ),
                  ),
                onChanged: (productName){
                    searchFromFireStore(productName);
                },
                ),
              ),
          ),
          body: ListView.builder(
            itemCount: searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: searchResult[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      searchResult[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headline4,
                    ),
                    subtitle: Text(
                      searchResult[index].description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headline6,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(searchResult[index].imgUrl),
                    ),
                  ),
                );
              },
    ),


    //  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    //       future: Provider.of<ProductDAO>(context).getAllProducts(),
    //       builder: (context, snapshot) {
    //         QuerySnapshot querySnapshot = snapshot.data!;
    //         final List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    //         List<ProductModel> allProductsList = documents.map(
    //                 (doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>)
    //         ).toList();
    //
    //         return (snapshot.connectionState == ConnectionState.waiting)
    //             ? const Center(
    //           child: CircularProgressIndicator(),
    //         )
    //             : ListView.builder(
    //             itemCount: allProductsList.length,
    //             itemBuilder: (context, index) {
    //               if (name.isEmpty) {
    //                 return ListTile(
    //                     title: Text(
    //                       allProductsList[index].name,
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: theme.textTheme.headline4,
    //                     ),
    //                     subtitle: Text(
    //                       allProductsList[index].description,
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: theme.textTheme.headline6,
    //                     ),
    //                     leading: CircleAvatar(
    //                       backgroundImage: NetworkImage(allProductsList[index].imgUrl),
    //                     ),
    //                   );
    //               }
    //               if (allProductsList[index].name
    //                   .toString()
    //                   .toLowerCase()
    //                   .startsWith(name.toLowerCase())) {
    //                 return InkWell(
    //                   onTap: (){
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => ProductDetailScreen(product: allProductsList[index]),
    //                       ),
    //                     );
    //                   },
    //                   child: ListTile(
    //                     title: Text(
    //                       allProductsList[index].name,
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: theme.textTheme.headline4,
    //                     ),
    //                     subtitle: Text(
    //                       allProductsList[index].description,
    //                       maxLines: 1,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: theme.textTheme.headline6,
    //                     ),
    //                     leading: CircleAvatar(
    //                       backgroundImage: NetworkImage(allProductsList[index].imgUrl),
    //                     ),
    //                   ),
    //                 );
    //               }
    //               return Container();
    //             });
    //       },
    //     ),
    );
  }

}
