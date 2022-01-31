import 'package:auto_route/auto_route.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/green_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/red_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      path: "/detail-page/:id",
      page: DetailPage,
    ),
    AutoRoute(
      path: "/blue-page",
      page: BluePage,
    ),
    AutoRoute(
      path: "/green-page",
      page: GreenPage,
    ),
    AutoRoute(
      path: "/red-page",
      page: RedPage,
    ),
  ],
)
class $AppRouter {}
