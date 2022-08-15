import 'package:dingy_mart/ui/widgets/common_snackbar.dart';
import 'package:flutter/material.dart';

Widget commonCard(BuildContext context, int index, AsyncSnapshot<dynamic>snapshot, ThemeData theme, double width, double height ){
  return Card(
    child: ListView.builder(
      itemCount: snapshot.data.length,
        itemBuilder: (itemBuilderContext, index){
          if(!snapshot.hasData){
            showSnackBar(context, 'Can\'t display data');
          }
          else if(snapshot.hasData){
            return Container(
              decoration: BoxDecoration(
                image: snapshot.data[index]
              ),
              child: Text(
                snapshot.data[index],
                style: theme.textTheme.headline4,
              ),
            );
          }
          return const CircularProgressIndicator();
        }
    ),

  );

}