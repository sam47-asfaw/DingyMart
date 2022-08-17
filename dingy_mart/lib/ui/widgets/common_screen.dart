import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'common_widgets.dart';
import 'package:dingy_mart/repository/repository.dart';

class CommonScreen extends StatefulWidget {
  final String appBartitle;
  const CommonScreen({
    Key? key,
    required this.appBartitle,
  }) : super(key: key);

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  final _searchController = TextEditingController();

  final theme = AppTheme.commonTheme();

  final List<String> images = [
    'assets/category_images/mobile2.jpg',
    'assets/category_images/electronics.jpg',
    'assets/category_images/bottomWear.jpg',
    'assets/category_images/footWear.jpeg',
    'assets/category_images/innerWear.jpeg',
    'assets/category_images/topWear.jpeg',
    'assets/category_images/sportsWear.jpeg',
    'assets/category_images/winterWear.jpg',
    'assets/category_images/accessories.jpeg',
    'assets/category_images/home.jpeg',
  ];

  final List<String> titles = [
    'Mobile',
    'Electronics',
    'BottomWear',
    'FootWear',
    'InnerWear',
    'TopWear',
    'SportsWear',
    'WinterWear',
    'Accessories',
    'Home Appliance'
  ];

   late Stream<QuerySnapshot> _allProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allProducts = context.read<ProductDAO>().getAllProducts();
  }

  @override
  void dispose(){
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: CommonAppBar(context, theme),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainBody(context, theme,images,titles,width, height),
            ],
          ),
         bottomNavigationBar: const CommonBottomNavBar(),
    );
  }

  //Category body
Widget _buildCategoryBody(BuildContext context,ThemeData theme, images ,titles, double width, double height){
    return commonCircleAvatar(context, theme, images, titles, height, width);
  }

  //MainBody
 Widget _buildMainBody(BuildContext context, ThemeData theme,images ,titles, double width, double height){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(height: 5.0,),
        _displayUserInfo(context,theme),
        const SizedBox(height: 5.0,),
        _buildCategoryBody(context, theme, images, titles, width, height),
        const SizedBox(height: 2.0,),
       _displayProducts(context, theme, height, width,
        ),
      ],
    );
 }

 //User info
  Widget _displayUserInfo(BuildContext context, ThemeData theme){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            UniconsLine.location_pin_alt,
            size: 20,
            color: theme.iconTheme.color,
          ),
          Text(
            'Deliver to Sam, Addis Ababa',
            style: theme.textTheme.caption,
          ),
        ],
    );
  }
  //product catalog
Widget _displayProducts(BuildContext context, ThemeData theme, double width, double height){
    return StreamBuilder<QuerySnapshot>(
      stream: _allProducts,
      builder:(BuildContext context, snapshot){
        if(snapshot.hasError){
           showSnackBar(context, snapshot.error.toString());
        }
        if(snapshot.connectionState == ConnectionState.active){
          QuerySnapshot<Object?>? querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot<Object?>>? listQuerySnapshot = querySnapshot?.docs.toList();
          return commonCardGrid(context, listQuerySnapshot!, theme, width, height);

        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

    );
  }
}


