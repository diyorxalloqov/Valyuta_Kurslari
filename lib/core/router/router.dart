import 'package:flutter/material.dart';
import 'package:navigating_routing/model/UserModel.dart';
import 'package:navigating_routing/ui/MainPage.dart';
import 'package:navigating_routing/ui/SecondPage.dart';

class RouteList {
  static final RouteList _generate = RouteList._init();
  static RouteList get router => _generate;

  RouteList._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const MainPage());
      case "SecondPage":
        return _navigate(SecondPage(data: settings.arguments as UserModel));
    }
  }

  _navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
