import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/all.mocks.dart';
import 'utils/test_utils.dart';

void main() {
  late MockNavigatorObserver observer;

  setUp(() {
    observer = MockNavigatorObserver();

    navHelper = NavHelper(
      navigatorKey: GlobalKey<NavigatorState>(),
      observer: observer,
    );
  });

  testWidgets('should call push correctly', (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_1"));
    await tester.tap(btn);
    await tester.pumpAndSettle();

    verify(observer.didPush(any, any)).called(2);
    expectCurrentPage(navHelper, DetailPage);
  });

  testWidgets("should call pop correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_1"));
    await tester.tap(btn);
    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);
    await tester.pumpAndSettle();

    verify(observer.didPop(any, any)).called(1);
    expectCurrentPage(navHelper, HomePage);
  });

  testWidgets("should call pushAll correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btn = find.byKey(Key("btn_colors"));
    await tester.tap(btn);
    await tester.pumpAndSettle();

    verify(observer.didPush(any, any)).called(4);
    expectCurrentPage(navHelper, BluePage);
  });

  testWidgets("should call popUntil correctly", (WidgetTester tester) async {
    await pumpRouterApp(tester, navHelper);

    Finder btnColors = find.byKey(Key("btn_colors"));
    await tester.tap(btnColors);

    await tester.pumpAndSettle();

    Finder btnPop = find.byKey(Key("btn_pop"));
    await tester.tap(btnPop);

    await tester.pumpAndSettle();
    verify(observer.didPop(any, any)).called(3);

    expectCurrentPage(navHelper, HomePage);
  });
}
