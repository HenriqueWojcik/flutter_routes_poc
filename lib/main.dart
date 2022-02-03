import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';

// Exemplo de roteamento usando navigator 1.0.
// Para aplicativos e módulos onde não é necessário um roteamento complexo, é aconcelhavel utilizar esse exemplo como base.
// Para roteamentos mais complexo, por favor utilizar o exemplo do "auto_route".
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
  void initState() {
    super.initState();
    navHelper.handleDeepLink(widget.deeplink!);
  }

  //No Navigator 1.0 é aconcelhável inicilizar a rota desta maneira e não usar a variável "home" do MaterialApp.
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
