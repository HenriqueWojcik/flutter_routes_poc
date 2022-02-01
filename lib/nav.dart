import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

NavHelper navHelper = NavHelper(
  fluroRouter: FluroRouter(),
  observers: <NavigatorObserver>[NavigatorObserver()],
);

class NavHelper implements NavHelperInterface {
  late FluroRouter fluroRouter;
  final List<NavigatorObserver> observers;

  NavHelper({
    required this.fluroRouter,
    required this.observers,
  });

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  push<T>(BuildContext context, String route) {
    fluroRouter.navigateTo(context, route);
  }

  @override
  pushAll(BuildContext context, List<String> routes) {
    for (var element in routes) {
      fluroRouter.navigateTo(context, element);
    }
  }

  @override
  pop<T>(BuildContext context) {
    fluroRouter.pop<T>(context);
  }
}

abstract class NavHelperInterface {
  push<T>(BuildContext context, String route);
  pushAll(BuildContext context, List<String> routes);
  pop<T>(BuildContext context);
}
