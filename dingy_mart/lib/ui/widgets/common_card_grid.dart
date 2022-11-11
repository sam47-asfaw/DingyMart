import 'package:dingy_mart/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonCardGrid(
    BuildContext context,
    List<ProductModel> products,
    ThemeData theme, double height, double width
    ){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/productDetail');
              },
                child: SizedBox(
                  height: height/2,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                      itemBuilder: (BuildContext context, int index){
                        return  Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.indigo.shade50,
                          elevation: 18,
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                            child: Container(
                              height: height / 4,
                              padding: const EdgeInsets.all(5.0),
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(products[index].imgUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
            );
}
