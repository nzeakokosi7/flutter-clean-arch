import 'package:flutter/material.dart';

class AppPageRoute {
  AppPageRoute._();

  static MaterialPageRoute<T> routeTo<T>({
    required Widget Function(BuildContext) builder,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    // return MaterialPageRoute<T>(
    return _AppPageRoute<T>(
      builder: builder,
      maintainState: maintainState,
      settings: settings,
    );
  }
}

class _AppPageRoute<T> extends MaterialPageRoute<T> {
  _AppPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
  }) : super(
      settings: settings,
      builder: builder,
      maintainState: maintainState);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final theme = Theme.of(context).pageTransitionsTheme;

    return theme.buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }
}