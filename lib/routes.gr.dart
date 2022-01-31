// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import 'pages/colors_page/blue_page.dart' as _i3;
import 'pages/colors_page/green_page.dart' as _i4;
import 'pages/colors_page/red_page.dart' as _i5;
import 'pages/detail_page.dart' as _i2;
import 'pages/home_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    DetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailPageRouteArgs>(
          orElse: () => DetailPageRouteArgs(id: pathParams.getInt('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailPage(key: args.key, id: args.id));
    },
    BluePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BluePage());
    },
    GreenPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.GreenPage());
    },
    RedPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RedPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomePageRoute.name, path: '/'),
        _i6.RouteConfig(DetailPageRoute.name, path: '/detail-page/:id'),
        _i6.RouteConfig(BluePageRoute.name, path: '/blue-page'),
        _i6.RouteConfig(GreenPageRoute.name, path: '/green-page'),
        _i6.RouteConfig(RedPageRoute.name, path: '/red-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.DetailPage]
class DetailPageRoute extends _i6.PageRouteInfo<DetailPageRouteArgs> {
  DetailPageRoute({_i7.Key? key, required int id})
      : super(DetailPageRoute.name,
            path: '/detail-page/:id',
            args: DetailPageRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'DetailPageRoute';
}

class DetailPageRouteArgs {
  const DetailPageRouteArgs({this.key, required this.id});

  final _i7.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailPageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.BluePage]
class BluePageRoute extends _i6.PageRouteInfo<void> {
  const BluePageRoute() : super(BluePageRoute.name, path: '/blue-page');

  static const String name = 'BluePageRoute';
}

/// generated route for
/// [_i4.GreenPage]
class GreenPageRoute extends _i6.PageRouteInfo<void> {
  const GreenPageRoute() : super(GreenPageRoute.name, path: '/green-page');

  static const String name = 'GreenPageRoute';
}

/// generated route for
/// [_i5.RedPage]
class RedPageRoute extends _i6.PageRouteInfo<void> {
  const RedPageRoute() : super(RedPageRoute.name, path: '/red-page');

  static const String name = 'RedPageRoute';
}
