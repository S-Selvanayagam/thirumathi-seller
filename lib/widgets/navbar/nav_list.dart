import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';

var navList = [
  {
    'title': 'Home',
    'icon': const Icon(Icons.home_outlined),
    'toRoute': NavigationRoutes.home,
  },
  {
    'title': 'Add Product',
    'icon': const Icon(Icons.shopping_cart_outlined),
    'toRoute': NavigationRoutes.addProduct,
  },
  {
    'title': 'Profile',
    'icon': const Icon(Icons.person_outline),
    'toRoute': NavigationRoutes.profileRoute,
  },
];
