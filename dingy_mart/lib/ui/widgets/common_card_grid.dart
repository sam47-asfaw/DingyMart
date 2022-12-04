import 'package:dingy_mart/model/model.dart';
import 'package:dingy_mart/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'common_widgets.dart';

Widget commonCardGrid(
    BuildContext context,
    List<ProductModel> products,
    ThemeData theme, double height, double width
    ){
            return SizedBox(
                      height: height,
                      width: width / 2 ,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                            itemBuilder: (BuildContext context, int index){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(product: products[index]),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          width: width / 2.5,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 10,
                                          ),
                                            decoration: BoxDecoration(

                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: NetworkImage(products[index].imgUrl),
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
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                          Column(
                                              mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children:[
                                                        buildProductNameWidget(products[index].name, theme) ,
                                                        const SizedBox(height: 5.0),
                                                        buildProductPriceWidget(products[index].price.toString(), theme) ,
                                                      ],
                                                  ),
                                                ],
                                          ),
                                  ],
                                ),
                              );
                            }
                        ),
            );
}

