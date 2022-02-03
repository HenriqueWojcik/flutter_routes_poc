import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpRouterApp(WidgetTester tester, NavHelper navHelper,
    {String? deeplink}) {
  return tester
      .pumpWidget(
        MaterialApp(
          onGenerateRoute: navHelper.fluroRouter.generator,
          navigatorObservers: navHelper.observers,
        ),
      )
      .then((_) => tester.pumpAndSettle());
}
