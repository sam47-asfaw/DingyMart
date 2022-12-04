import 'package:dingy_mart/app_theme.dart';
import 'package:dingy_mart/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dingy_mart/ui/screens/screens.dart';

class AppRouter{

  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case '/':
        return MaterialPageRoute(
            builder: (_) =>  const HomeScreen()
        );
      case '/login':
        return MaterialPageRoute(
            builder: (_) => const LoginScreen()
        );
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => const SignupScreen()
        );
      case '/search':
        return MaterialPageRoute(
            builder: (_) => const SearchScreen(appBarTitle: 'DingyMart',)
        );
      case '/accessories':
        return MaterialPageRoute(
            builder: (_) => const AccessoriesCategoryScreen(title:'accessories')
        );
      case '/bottom':
        return MaterialPageRoute(
            builder: (_) => const BottomWearCategoryScreen(title: 'bottomWear')
        );
      case '/cart':
        return MaterialPageRoute(
            builder: (_) => const CartScreen()
        );
      case '/categories':
        return MaterialPageRoute(
            builder: (_) => CategoriesScreen(
              titles: Constants.titles,
              images: Constants.images,
              theme: AppTheme.commonTheme(),
            )
        );
      case '/electronics':
        return MaterialPageRoute(
            builder: (_) => const ElectronicsCategoryScreen(title: 'electronics')
        );
      case '/foot':
        return MaterialPageRoute(
            builder: (_) => const FootWearCategoryScreen(title: 'footWear')
        );
      case '/home':
        return MaterialPageRoute(
            builder: (_) => const HomeCategoryScreen(title: 'home')
        );
      case '/inner':
        return MaterialPageRoute(
            builder: (_) => const InnerWearCategoryScreen(title: 'innerWear')
        );
      case '/mobile':
        return MaterialPageRoute(
            builder: (_) => const MobilesCategoryScreen(title: 'mobiles')
        );
      case '/order':
        return MaterialPageRoute(
            builder: (_) => const OrderDetailScreen()
        );
      // case '/productDetail':
      //   return MaterialPageRoute(
      //       builder: (_) => ProductDetailScreen(
      //         product: Co,
      //       )
      //   );
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
            builder: (_) => const SportsWearCategoryScreen(title: 'sportsWear')
        );
      case '/top':
        return MaterialPageRoute(
            builder: (_) => const TopWearCategoryScreen(title: 'topWear')
        );
      case '/winter':
        return MaterialPageRoute(
            builder: (_) => const WinterWearCategoryScreen(title: 'winterWear')
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