import 'package:flutter/material.dart';
import 'package:news_app/pressentation_layer/screens/details_screen.dart';
import 'package:news_app/pressentation_layer/screens/news_screen.dart';

import 'constants/strings.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newsScreen:
        return MaterialPageRoute(
          builder: (_) => NewsScreen(),
        );
      case detailsScreen:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(),
        );
    }
  }
}
