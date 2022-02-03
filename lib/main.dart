import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/routes.dart';

// Está POC consiste em servir de exemplo um mini projeto para o package "fluro".
// Link do package: https://pub.dev/packages/fluro

// Para melhor entendimento de como fazer push, pop, pushAll, popUntil, entre no arquivo "nav.dart"

// Para melhor entendimento de como setar as rotas, entre no arquivo "routes.dart"

// Para começo, aqui estou passando a váriavel global "navHelper", onde possui uma váriavel "fluroRouter" que é encarregada de fazer o roteamento do app.
// Obs: Fazer essa injeção de variável por injeção de dependencia (não fiz isso aqui por conta que iria fujir do objetivo da POC).

// Para deeplinks também fiz um exemplo básico, não necessariamente precisa ser desse modo.
void main() {
  runApp(MyApp(
    navHelper: navHelper,
    deeplink: "/detail-page?id=2",
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
    Routes.configureRoutes(navHelper.fluroRouter, deeplink: widget.deeplink);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: navHelper.fluroRouter.generator,
    );
  }
}
