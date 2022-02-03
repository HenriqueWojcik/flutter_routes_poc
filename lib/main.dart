import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';

// Está POC consiste em servir de exemplo um mini projeto para o package "auto_route".
// Link do package: https://pub.dev/packages/auto_route

// Para melhor entendimento de como fazer push, pop, pushAll, popUntil, entre no arquivo "nav.dart"

// Para melhor entendimento de como setar as rotas, entre no arquivo "routes.dart"

// Para esse pacote é necessário a geração de código, segue o comando:
// flutter packages pub run build_runner build
// ou
// flutter packages pub run build_runner watch

// Para começo, aqui estou passando a váriavel global "navHelper", onde possui uma váriavel "appRouter" que é encarregada de fazer o roteamento do app.
// Obs: Fazer essa injeção de variável por injeção de dependencia (não fiz isso aqui por conta que iria fujir do objetivo da POC).

// Para deeplinks também fiz um exemplo básico, não necessariamente precisa ser desse modo.
void main() {
  runApp(MyApp(
    navHelper: navHelper,
    // deeplink: "/detail-page/2",
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
  // Para o uso do package é obrigatório que seja usado o método "router" dentro do MaterialApp.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // O pacote possui esse delegate, é interessante ver os restantes dos parametros para um melhor entendimento do pacote todo em sí.
      routerDelegate: widget.navHelper.appRouter.delegate(
          initialDeepLink: widget.deeplink,
          navigatorObservers: () =>
              <NavigatorObserver>[widget.navHelper.observer]),
      routeInformationParser: widget.navHelper.appRouter.defaultRouteParser(),
    );
  }
}
