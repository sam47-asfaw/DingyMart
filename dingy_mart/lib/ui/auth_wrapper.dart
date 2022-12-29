import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dingy_mart/ui/screens/home_screen.dart';
import 'package:dingy_mart/ui/screens/login_screen.dart';
import 'package:dingy_mart/ui/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser != null){
      return const HomeScreen();
    }
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const SplashScreen(),
        duration: 2500,
         //splashTransition:SplashTransition.fadeTransition,
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
