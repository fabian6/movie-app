import 'package:flutter/material.dart';
import 'package:movies/screens/screens.dart';

class AppRoutes {

  static Map<String, Widget Function(BuildContext)> routes = {
    'home' : (_) => HomeScreen(),
    'details' : (_) => DetailsScreen()
  };
}