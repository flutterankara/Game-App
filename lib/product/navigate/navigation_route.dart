import 'package:flutter/material.dart';
import 'package:gameapp/feature/gameplay/gameplay_view.dart';
import '../../feature/splash/splash_view.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name!.navValue) {
      case NavEnums.init:
        return _normalNavigate(const SplashView());
      case NavEnums.gameplay:
        return _normalNavigate(const GameplayView());
      default:
        throw Exception('$this not found');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }
}
