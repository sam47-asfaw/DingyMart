import 'package:flutter/material.dart';

Widget commonCircleAvatar(BuildContext context, ThemeData theme,
    List<String> _images, List<String> _titles,
    double height, double width
    ){
  return Padding(
    padding: const EdgeInsets.only(
      top: 15.0,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
         onTap:(){
           _onTap(context, _titles);
         },
        child: SizedBox(
          height: height/4,
          width: width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // separatorBuilder: (context, index)=> const Divider(),
            itemCount: _titles.length ,
            itemBuilder: (context, index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                    ),
                    child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(_images[index]),
                          radius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0,
                      right: 6.0,
                    ),
                    child: Text(
                      _titles[index],
                      style: theme.textTheme.caption,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
}

void _onTap(BuildContext context, List<String> _titles){
  for(var _title in _titles){
    switch(_title){
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
}