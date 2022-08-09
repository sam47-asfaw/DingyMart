import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  const CommonScreen({Key? key}) : super(key: key);

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  final _searchController = TextEditingController();
  final theme = AppTheme.commonTheme();
  final List<String> images = [
    'assets/category_images/mobile.jpg',
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

  @override
  void dispose(){
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
