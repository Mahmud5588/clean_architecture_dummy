import 'package:clean_architecture_dummy/app.dart';
import 'package:clean_architecture_dummy/core/route/route_names.dart';
import 'package:flutter/material.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => MyApp());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    ),
  );
}
