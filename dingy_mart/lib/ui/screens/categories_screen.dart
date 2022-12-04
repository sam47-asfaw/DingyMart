import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';

class CategoriesScreen extends StatelessWidget {
    CategoriesScreen ({
    Key? key,
    required this.titles,
    required this.images,
     required this.theme,
  }) : super(key: key);

    final List<String> titles;
    final List<String> images;
    final ThemeData theme;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: GridView.builder(
              physics: const ClampingScrollPhysics(),
              primary: false,
              padding: const EdgeInsets.all(20),
               itemCount: images.length,
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent: 200,
                   childAspectRatio: 3 / 2,
                   crossAxisSpacing: 20,
                   mainAxisSpacing: 20,
               ),
               itemBuilder: (BuildContext context, int index) {
                return  GestureDetector(
                       onTap:(){
                         _onTap(context, titles[index]);
                      },
                    child: Container(
                          alignment: Alignment.center,
                            width: width,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
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
                      child: Stack(
                        children: [
                          Positioned(
                            top: 60,
                              child: Container(
                                  height: 35,
                                  width: width / 3,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.4),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                child:
                                Text(
                                titles[index],
                                  style: theme.textTheme.headline5,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  );
               },
              ),
      ),
      );
  }
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

