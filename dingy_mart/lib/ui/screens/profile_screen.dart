import 'package:dingy_mart/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import '../../app_theme.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.commonTheme();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:AppBar(
        foregroundColor: theme.appBarTheme.foregroundColor,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        leading: Builder(
          builder: (BuildContext context) {
          return IconButton(
            color: Colors.indigo,
            iconSize: theme.iconTheme.size,
            icon: const Icon(UniconsLine.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          );
        },
      ),
        title: Text(
           context.read<UserDAO>().email()!,
           style: theme.textTheme.headline5,
         ),
         centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
               'assets/splashScreen/online_shopping_monochromatic.svg',
               width: width ,
               height: height / 2,
             ),
            const SizedBox(height: 6.0,),
            TextButton.icon(
              onPressed: () {
                context.read<UserDAO>().signOut(context);
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(UniconsLine.sign_out_alt),
              label: Text(
                'Logout',
                style: theme.textTheme.headline3,
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.indigo.shade50,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
