import 'package:flutter/material.dart';

import '../widgets/common_screen.dart';

class ElectronicsCategoryScreen extends StatelessWidget {
  final String title;
  const ElectronicsCategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(category: title,);
  }
}
