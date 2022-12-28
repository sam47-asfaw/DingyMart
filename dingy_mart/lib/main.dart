import 'package:dingy_mart/model/cart_model.dart';
import 'package:dingy_mart/repository/user_dao.dart';
import 'package:dingy_mart/ui/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/ui/app_router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:dingy_mart/repository/repository.dart';
import 'model/user_model.dart';
import 'providers/notifiers.dart';

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
    return MultiProvider(
      providers:[
        Provider<UserDAO>(
          create:(_) => UserDAO(FirebaseAuth.instance),
        ),
        StreamProvider(
        create: (context) => context.read<UserDAO>().authState,
       initialData: null,
       ),
        Provider<ProductDAO>(
          create: (_) => ProductDAO(),
        ),
        Provider<UserDAO>(
          create: (_) => UserDAO(UserCredential),
        ),
        Provider<UserModel>(
            create:(_) => UserModel(),
    ),
        ChangeNotifierProvider(
          create: (_) => CartNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishListNotifier(),
        ),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DingyMart',
          home: const AuthWrapper(),
          onGenerateRoute: _appRouter.onGenerateRoute,
        )
    );
  }
}

