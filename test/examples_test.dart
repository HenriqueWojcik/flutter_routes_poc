import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/red_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'mocks/all.mocks.dart';
import 'utils/test_utils.dart';

void main() {
  late MockNavigatorObserver observer;

  setUp(() {
    observer = MockNavigatorObserver();

    navHelper = NavHelper(
      fluroRouter: FluroRouter(),
      observers: <NavigatorObserver>[observer],
    );

    Routes.configureRoutes(navHelper.fluroRouter);
  });

  testWidgets('should call push to detail page correctly',
      (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_1"));
    await tester.tap(btn);
    await tester.pumpAndSettle();

    verify(observer.didPush(any, any)).called(2);
    expect(find.byType(DetailPage), findsOneWidget);
  });

  testWidgets("should call pushAll correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_colors"));
    await tester.tap(btn);

    await tester.pumpAndSettle();

    verify(observer.didPush(any, any)).called(4);
    expect(find.byType(BluePage), findsOneWidget);
  });

  // TODO
  // testWidgets("should stack screens correctly with deeplink",
  //     (WidgetTester tester) async {
  //   await pumpRouterApp(tester, navHelper, deeplink: "/detail-page?id=2");

  //   await tester.pumpAndSettle();

  //   expectCurrentPage(navHelper.fluroRouter, Routes.redPage);
  // });

  // testWidgets("should call pop correctly", (WidgetTester tester) async {
  //   await pumpRouterApp(tester, navHelper, deeplink: "/detail-page?id=2");

  //   await tester.pumpAndSettle();

  //   Finder btnPop = find.byKey(Key("btn_pop"));
  //   await tester.tap(btnPop);

  //   expectCurrentPage(navHelper.fluroRouter, Routes.homePage);
  // });
}
