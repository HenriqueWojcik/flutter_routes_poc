import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpRouterApp(WidgetTester tester, NavHelper navHelper,
    {String? deeplink}) {
  return tester
      .pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
          },
          navigatorKey: navHelper.navigatorKey,
          navigatorObservers: [navHelper.observer],
        ),
      )
      .then((_) => tester.pumpAndSettle());
}

void expectCurrentPage(NavHelper navHelper, Type widget) {
  expect(find.byType(widget), findsOneWidget);
}

void expectStack(NavHelper navHelper, List<String> stackNames) {
  for (int i = 0; i < stackNames.length; i++) {
    // expect(router.stack[i].name, stackNames[i]);
  }
}
