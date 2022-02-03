import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';

void main() {
  runApp(MyApp(
    navHelper: navHelper,
    deeplink: "2",
  ));
}

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
    required this.navHelper,
    this.deeplink,
  }) : super(key: key);

  late NavHelper navHelper;
  late String? deeplink;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navHelper.navigatorKey,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      navigatorObservers: [navHelper.observer],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
