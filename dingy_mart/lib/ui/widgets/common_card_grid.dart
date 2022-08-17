import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:dingy_mart/model/model.dart';
import 'package:flutter/material.dart';

Widget commonCardGrid(BuildContext context,  List<QueryDocumentSnapshot<Object?>>? snapshot, ThemeData theme, double height, double width){
  return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          ),
          shrinkWrap: true,
          itemCount: snapshot?.length,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/productDetail');
            },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shadowColor: Colors.indigo.shade50,
                elevation: 15,
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  child: Container(
                      height: height / 3,
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                        image: DecorationImage(
                        image: NetworkImage(snapshot![index]['imgUrl']),
                          fit: BoxFit.cover,
                         ),
                        ),
                        ),
                      ),
                  ),
                ),
            );
          },
  );
}
