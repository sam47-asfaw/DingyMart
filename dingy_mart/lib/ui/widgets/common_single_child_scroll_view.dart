import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingy_mart/ui/widgets/common_card_grid.dart';
import 'package:flutter/material.dart';

Widget commonSingleChildScrollView(
    BuildContext context,  List<QueryDocumentSnapshot<Object?>>? snapshot,
   List<String> titles, ThemeData theme, double width, double height) {
  return ListView.builder(
      itemCount: titles.length,
        itemBuilder: (BuildContext context, int index){
        return SizedBox(
            height: height/4,
            width: width,
         child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles[index],
                style: theme.textTheme.headline3,
              ),
              const SizedBox(
                height: 5.0,
              ),
              commonCardGrid(context, snapshot, theme, height, width),
            ],
          ),
         ),
        );
        },
  );

}