import 'package:fluro/fluro.dart';
import 'package:flutter_routes_poc/routes_handler.dart';

class Routes {
  static String homePage = "/";
  static String detailPage = "/detail-page";
  static String redPage = "/red-page";
  static String bluePage = "/blue-page";
  static String greenPage = "/green-page";

  static void configureRoutes(FluroRouter router, {String? deeplink}) {
    router.define("/", handler: homeHandler);

    router.define(detailPage, handler: detailHandler);
    router.define(redPage, handler: redHandler);
    router.define(bluePage, handler: blueHandler);
    router.define(greenPage, handler: greenHandler);
  }
}
