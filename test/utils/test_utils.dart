import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpRouterApp(WidgetTester tester, RootStackRouter router,
    {String? deeplink}) {
  return tester
      .pumpWidget(
        MaterialApp.router(
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate(
            initialDeepLink: deeplink,
          ),
        ),
      )
      .then((_) => tester.pumpAndSettle());
}

void expectCurrentPage(StackRouter router, String name) {
  expect(router.current.name, name);
}

void expectStack(StackRouter router, List<String> stackNames) {
  for (int i = 0; i < stackNames.length; i++) {
    expect(router.stack[i].name, stackNames[i]);
  }
}
