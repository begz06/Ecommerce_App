///////        Singletone

import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/pages/MainPage.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/pages/pageViewScreen.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/ui/pages/splashScreen.dart';
import 'package:flutter/material.dart';

class RouteList {
  static final RouteList _generate = RouteList.init();
  static RouteList get router => _generate;

  RouteList.init();

  Route? onGenrate(RouteSettings settings) {
    switch (settings.name) {
      case "SplashScreen":
        return _navigate(const SplashScreen());
      case "PageViewScreen":
        return _navigate(const PageViewScreen());
      case "HomePage":
        return _navigate(const HomePage());
    }
    return null;
  }

  MaterialPageRoute _navigate(Widget widget) {
    return MaterialPageRoute(
      builder: ((context) => widget),
    );
  }
}
