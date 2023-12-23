import 'package:flutter/material.dart';

import '../../product/navigate/navigation_enums.dart';

NavigationService get ns => NavigationService.instance;

abstract class INavigationService {
  Future<T?> navigateToPage<T>(NavEnums nav, {Object? data});
  Future<T?> navigateToPageClear<T>(NavEnums nav, {Object? data});
  void pop<T extends Object?>([T? object]);
}

class NavigationService implements INavigationService {
  static NavigationService? _instace;
  static NavigationService get instance {
    _instace ??= NavigationService._init();
    return _instace!;
  }

  NavigationService._init();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  BuildContext? get _context => navigatorKey.currentState?.overlay?.context;
  BuildContext get context => _context!;

  @override
  Future<T?> navigateToPage<T>(NavEnums nav, {Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(nav.rawValue, arguments: data);
  }

  @override
  Future<T?> navigateToPageClear<T>(NavEnums nav, {Object? data}) async {
    return await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(nav.rawValue, (Route<dynamic> route) => false, arguments: data);
  }

  @override
  void pop<T extends Object?>([T? object]) {
    navigatorKey.currentState?.pop(object);
  }
}
