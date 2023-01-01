import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dingy_mart/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/user_dao.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserDAO>();
    if(firebaseUser.isLoggedIn()){
      return const HomeScreen();
    }
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const SplashScreen(),
        duration: 2500,
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
