import 'package:dingy_mart/ui/widgets/common_screen.dart';
import 'package:flutter/material.dart';

class InnerWearCategoryScreen extends StatelessWidget {
  final String title;
  const InnerWearCategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(category: title);
  }
}
