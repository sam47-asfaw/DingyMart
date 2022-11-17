import 'package:dingy_mart/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import '../../constants/constants.dart';
import '../widgets/common_widgets.dart';

class HomeScreen extends StatefulWidget {

    const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  final theme = AppTheme.commonTheme();
  final images = Constants.images;
  final titles = Constants.titles;
  final categoryTitles = Constants.categoryTitles;

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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _displayUserInfo(context,theme),
                _buildCategoryBody(context, theme, images, titles, width, height),
                _displayProducts( context,
                  theme,width, height,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CommonBottomNavBar(),
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

  //Category body
  Widget _buildCategoryBody(BuildContext context,ThemeData theme,
      List<String> images ,List<String>titles, double width, double height){
    return commonCircleAvatar(context, theme, images, titles, height, width);
  }

  //product catalog
  Widget _displayProducts(
      BuildContext context,
      ThemeData theme, double height, double width){
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all( 16.0),
            child: Text(
              'Deals Of The Day 🎁',
              style: theme.textTheme.headline4,
            ),
          ),
          allProductDisplayWidget(context, theme, width, height),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Top Rated 💯',
              style: theme.textTheme.headline4,
            ),
          ),
          allProductDisplayWidget(context, theme, width, height),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recommended 💯',
              style: theme.textTheme.headline4,
            ),
          ),
          allProductDisplayWidget(context, theme, width, height),
        ]
    );
  }

}
