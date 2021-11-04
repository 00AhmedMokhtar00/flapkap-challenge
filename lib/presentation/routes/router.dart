import 'package:flutter/material.dart';

import '../pages/splash/splash.dart';
import '../pages/home/home.dart';

class AppRouter{
  static const String initialRoute = SplashPage.routeName;

  static Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => SplashPage(),
    HomePage.routeName: (context) => const HomePage(),
  };

}