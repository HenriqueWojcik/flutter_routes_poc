import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/green_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/red_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? param = params['deeplink']?.first;

  return HomePage(deeplink: param);
});

var detailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? param = params['id']?.first;

  if (param != null) {
    int id = int.parse(param);

    return DetailPage(id: id);
  }

  // return página de erro.
});

var redHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RedPage();
});

var blueHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BluePage();
});

var greenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return GreenPage();
});
