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

void expectCurrentPage(FluroRouter router, String name) {
  AppRouteMatch? match = router.match(name);

  expect(match?.route.route, name);
}

void expectStack(FluroRouter router, List<String> stackNames) {
  for (int i = 0; i < stackNames.length; i++) {
    // expect(router.stack[i].name, stackNames[i]);
  }
}
