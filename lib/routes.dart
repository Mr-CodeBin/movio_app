import 'package:flutter/material.dart';
import 'package:movio/models/movie_model.dart';
import 'package:movio/screens/detail_screen.dart';
import 'package:movio/screens/home_screen.dart';
import 'package:movio/screens/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';
  static const String details = '/details';

  final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    search: (context) => const SearchScreen(),
    details: (context) => MovieDetailsScreen(
        movie: ModalRoute.of(context)!.settings.arguments as Movie),
  };
}
