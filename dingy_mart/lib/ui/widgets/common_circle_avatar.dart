import 'package:flutter/material.dart';

Widget commonCircleAvatar(BuildContext context, ThemeData theme, List<String> _images, List<String> _titles){
  return GestureDetector(
    onTap: (){
      for(var title in _titles){
        switch(title){
          case 'Mobile':
            Navigator.pushNamed(context, '/mobile');
            break;
          case 'Electronics':
            Navigator.pushNamed(context, '/electronics');
            break;
          case 'BottomWear':
            Navigator.pushNamed(context, '/bottom');
            break;
          case 'FootWear':
            Navigator.pushNamed(context, '/foot');
            break;
          case 'InnerWear':
            Navigator.pushNamed(context, '/inner');
            break;
          case 'SportsWear':
            Navigator.pushNamed(context, '/sports');
            break;
          case 'Mobiles':
            Navigator.pushNamed(context, '/mobile');
            break;
          case 'WinterWear':
            Navigator.pushNamed(context, '/winter');
            break;
          case 'Accessories':
            Navigator.pushNamed(context, '/accessories');
            break;
          case 'Home Appliance':
            Navigator.pushNamed(context, '/home');
            break;
          default:
            Navigator.pushNamed(context, '/');
            break;

        }
      }
    },
    child: ListView.builder(
      itemCount: _titles.length ,
      itemBuilder: (context, index){
        return CircleAvatar(
          backgroundImage: AssetImage(_images[index]),
          radius: 50,
          maxRadius: 50,
          minRadius: 25,
          child: Text(
            _titles[index],
            style: theme.textTheme.headline5,
          ),
        );
      },
    ),
  );
}