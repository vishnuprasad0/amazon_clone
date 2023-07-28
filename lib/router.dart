import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomeScreen(),
      );
    case AccountScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AccountScreen(),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AddProductScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No screen found'),
          ),
        ),
      );
  }
}
