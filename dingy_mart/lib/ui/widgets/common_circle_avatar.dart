import 'package:flutter/material.dart';

Widget commonCircleAvatar(
    BuildContext context, ThemeData theme,
    List<String> _images, List<String> _titles,
    double height, double width
    ){
  return Padding(
    padding: const EdgeInsets.only(
      top: 15.0,
      bottom: 3.0,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: height/9,
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
                    child: GestureDetector(
                      onTap: (){
                        _onTap(context, _titles[index]);
                      },
                      child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(_images[index]),
                            radius: 30,
                      ),
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
  );
}

void _onTap(BuildContext context, String _title){
    if(_title == 'Mobile'){
      Navigator.pushNamed(context, '/mobile');
    }
    else if(_title == 'Electronics'){
      Navigator.pushNamed(context, '/electronics');
    }
    else if(_title == 'BottomWear'){
      Navigator.pushNamed(context, '/bottom');
    }
    else if(_title == 'FootWear'){
      Navigator.pushNamed(context, '/foot');
    }
    else if(_title == 'InnerWear'){
      Navigator.pushNamed(context, '/inner');
    }
    else if(_title == 'TopWear'){
      Navigator.pushNamed(context, '/top');
    }
    else if(_title == 'SportsWear'){
      Navigator.pushNamed(context, '/sports');
    }
    else if(_title == 'WinterWear'){
      Navigator.pushNamed(context, '/winter');
    }
    else if(_title == 'Accessories'){
      Navigator.pushNamed(context, '/accessories');
    }
    else if(_title == 'Home Appliance'){
      Navigator.pushNamed(context, '/home');
    }
    else{
      Navigator.pushNamed(context, '/');
    }
}
