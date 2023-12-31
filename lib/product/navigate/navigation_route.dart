import 'package:flutter/material.dart';
import 'package:gameapp/feature/leaderboard/leaderboard_view.dart';
import 'package:gameapp/feature/settings_screen/settings_view.dart';
import 'package:gameapp/feature/gameplay/gameplay_view.dart';
import 'package:gameapp/feature/mainmenu/mainmenu_view.dart';
import '../../feature/splash/splash_view.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name!.navValue) {
      case NavEnums.init:
        return _normalNavigate(const SplashView());
      case NavEnums.menu:
        return _normalNavigate(const MainMenuView());
      case NavEnums.gameplay:
        return _normalNavigate(const GameplayView());
      case NavEnums.settings:
        return _normalNavigate(const SettingsView());
      case NavEnums.leaderboard:
        return _normalNavigate(const LeaderboardView());
      default:
        throw Exception('$this not found');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }
}
