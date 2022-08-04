import 'package:flutter/material.dart';
import 'package:dingy_mart/ui/screens/screens.dart';

class AppRouter{

  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case '/':
        return MaterialPageRoute(
            builder: (_) =>  HomeScreen()
        );
      case '/login':
        return MaterialPageRoute(
            builder: (_) => const LoginScreen()
        );
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => const SignupScreen()
        );
      case '/accessories':
        return MaterialPageRoute(
            builder: (_) => const AccessoriesCategorScreen()
        );
      case '/bottom':
        return MaterialPageRoute(
            builder: (_) => const BottomWearCategoryScreen()
        );
      case '/cart':
        return MaterialPageRoute(
            builder: (_) => const CartScreen()
        );
      case '/categories':
        return MaterialPageRoute(
            builder: (_) => const CategoriesScreen()
        );
      case '/electronics':
        return MaterialPageRoute(
            builder: (_) => const ElectronicsCategoryScreen()
        );
      case '/foot':
        return MaterialPageRoute(
            builder: (_) => const FootWearCategoryScreen()
        );
      case '/home':
        return MaterialPageRoute(
            builder: (_) => const HomeCategoryScreen()
        );
      case '/inner':
        return MaterialPageRoute(
            builder: (_) => const InnerWearCategoryScreen()
        );
      case '/mobile':
        return MaterialPageRoute(
            builder: (_) => const MobilesCategoryScreen()
        );
      case '/order':
        return MaterialPageRoute(
            builder: (_) => const OrderDetailScreen()
        );
      case '/productDetail':
        return MaterialPageRoute(
            builder: (_) => const ProductDetailScreen()
        );
      case '/profile':
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen()
        );
      case '/offer':
        return MaterialPageRoute(
            builder: (_) => const SpecialOfferScreen()
        );
      case '/sports':
        return MaterialPageRoute(
            builder: (_) => const SportsWearCategoryScreen()
        );
      case '/top':
        return MaterialPageRoute(
            builder: (_) => const TopWearCategoryScreen()
        );
      case '/winter':
        return MaterialPageRoute(
            builder: (_) => const WinterWearCategoryScreen()
        );
      case '/wish':
        return MaterialPageRoute(
            builder: (_) => const WishlistScreen()
        );
      default:
        return null;
    }
  }
}