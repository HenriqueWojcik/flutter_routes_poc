import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/routes.gr.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/test_utils.dart';

void main() {
  setUp(() {
    navHelper = NavHelper(appRouter: AppRouter());
  });

  testWidgets('should call push correctly', (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper.appRouter);

    Finder btn = find.byKey(Key("btn_1"));
    await tester.tap(btn);

    expectCurrentPage(navHelper.appRouter, DetailPageRoute.name);
  });

  testWidgets("should call pushAll correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper.appRouter);

    Finder btn = find.byKey(Key("btn_colors"));
    await tester.tap(btn);

    expectStack(navHelper.appRouter, [
      HomePageRoute.name,
      RedPageRoute.name,
      GreenPageRoute.name,
      BluePageRoute.name
    ]);
  });

  testWidgets("should call popUntil correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper.appRouter);

    Finder btnColors = find.byKey(Key("btn_colors"));
    await tester.tap(btnColors);

    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);

    expectCurrentPage(navHelper.appRouter, RedPageRoute.name);
  });

  testWidgets("should stack screens correctly with deeplink",
      (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper.appRouter,
        deeplink: "/detail-page/2");

    await tester.pumpAndSettle();

    expectCurrentPage(navHelper.appRouter, DetailPageRoute.name);
  });

  testWidgets("should call pop correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper.appRouter,
        deeplink: "/detail-page/2");

    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);

    expectCurrentPage(navHelper.appRouter, HomePageRoute.name);
  });
}
