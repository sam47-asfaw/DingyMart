import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dingy_mart/app_theme.dart';
import 'package:dingy_mart/ui/app_router/app_router.dart';
import 'package:dingy_mart/ui/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        duration: 3500,
         // splashTransition:SplashTransition.fadeTransition,
        nextScreen: const LoginScreen(),
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
