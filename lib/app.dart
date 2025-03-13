import 'package:clean_architecture_dummy/core/route/route_generators.dart';
import 'package:clean_architecture_dummy/core/route/route_names.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.allProductPage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
