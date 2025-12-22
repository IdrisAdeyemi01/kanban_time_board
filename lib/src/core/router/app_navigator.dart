import 'package:flutter/cupertino.dart';

class AppNavigator {
  AppNavigator._();

  static AppNavigator instance = AppNavigator._();
  static AppNavigator get I => instance;
  static GlobalKey<NavigatorState>? get _navigatorKey =>
      GlobalKey<NavigatorState>(debugLabel: 'root');

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
  BuildContext? get currentContext => navigatorKey?.currentContext;
}
