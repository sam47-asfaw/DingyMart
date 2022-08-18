import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  final ThemeData theme = AppTheme.commonTheme();
    HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonScreen();
  }
}
