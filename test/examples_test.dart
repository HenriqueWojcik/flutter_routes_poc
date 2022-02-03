import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/routes.gr.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/all.mocks.dart';
import 'utils/test_utils.dart';

void main() {
  late MockNavigatorObserver observer;

  setUp(() {
    observer = MockNavigatorObserver();

    navHelper = NavHelper(
      appRouter: AppRouter(),
      observer: observer,
    );
  });

  testWidgets('should call push correctly', (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_1"));
    await tester.tap(btn);

    verify(observer.didPush(any, any)).called(1);
    expectCurrentPage(navHelper.appRouter, DetailPageRoute.name);
  });

  testWidgets("should call pushAll correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_colors"));
    await tester.tap(btn);

    verify(observer.didPush(any, any)).called(1);

    expectStack(navHelper.appRouter, [
      HomePageRoute.name,
      RedPageRoute.name,
      GreenPageRoute.name,
      BluePageRoute.name
    ]);
  });

  testWidgets("should call popUntil correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btnColors = find.byKey(Key("btn_colors"));
    await tester.tap(btnColors);

    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);

    verify(observer.didPop(any, any)).called(2);

    expectCurrentPage(navHelper.appRouter, RedPageRoute.name);
  });

  testWidgets("should stack screens correctly with deeplink",
      (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper, deeplink: "/detail-page/2");

    await tester.pumpAndSettle();

    verify(observer.didPush(any, any)).called(2);
    expectCurrentPage(navHelper.appRouter, DetailPageRoute.name);
  });

  testWidgets("should call pop correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper, deeplink: "/detail-page/2");

    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);

    verify(observer.didPop(any, any)).called(1);
    expectCurrentPage(navHelper.appRouter, HomePageRoute.name);
  });
}
