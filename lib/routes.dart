import 'package:eve_crafts/screens/setting.dart';
import 'package:flutter/material.dart';

// Import your screen widgets
import 'screens/authentication/login_screen.dart';
import 'screens/authentication/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/user_profile/user_profile_screen.dart';
import 'screens/user_profile/edit_profile_screen.dart';
import 'screens/shopping_cart/shopping_cart_screen.dart';
import 'screens/seller_profile_screen.dart';

// Define your routes
final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const HomeScreen(),
  '/login': (BuildContext context) => const LoginScreen(),
  '/signup': (BuildContext context) => const SignUpScreen(),
  '/userProfile': (BuildContext context) => const UserProfileScreen(),
  '/editProfile': (BuildContext context) => const EditProfileScreen(),
  '/Cart': (BuildContext context) => const ShoppingCartScreen(),
  '/sellerProfile': (BuildContext context) => const SellerProfileScreen(),
  '/settings': (BuildContext context) => const SettingsScreen(),
};
