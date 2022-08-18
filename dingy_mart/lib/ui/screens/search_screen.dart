import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../app_theme.dart';

class SearchScreen extends StatefulWidget {
  final String appBarTitle;
  const SearchScreen({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final theme = AppTheme.commonTheme();

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: double.infinity,
          leading: Center(
            child: Text(
              widget.appBarTitle,
              style: theme.textTheme.headline2,
            ),
          ),
          title: SizedBox(
            width: double.infinity,
            height: 50,
              child: _buildSearchBar(context, theme),
          ),
          ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ThemeData theme) {
    return TextField(
        controller: _searchController,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            FeatherIcons.search,
            color: Colors.indigo.shade100,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Colors.indigo.shade100,
                width: 1
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Colors.indigo.shade400,
                width: 1
            ),
          ),
          label: Text(
            'Search for...',
            style: theme.textTheme.headline5,
          ),
        ),
    );
  }
}
