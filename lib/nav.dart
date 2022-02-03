import 'package:flutter/material.dart';

import 'package:flutter_routes_poc/pages/detail_page.dart';

// NavigatorKey possui a variável de contexto, dá para usar em vários lugares que seja necessário passar o context por parametro.
// Observer é para afins de teste, com ele conseguimos mockar e ver se está sendo chamado corretamente os pushs/pops.

NavHelper navHelper = NavHelper(
  navigatorKey: GlobalKey<NavigatorState>(),
  observer: NavigatorObserver(),
);

class NavHelper implements NavHelperInterface {
  late GlobalKey<NavigatorState> navigatorKey;
  late NavigatorObserver observer;

  NavHelper({
    required this.navigatorKey,
    required this.observer,
  });

  @override
  push<T>(Widget page) {
    final WidgetBuilder builder = (_) => page;

    return navigatorKey.currentState?.push(MaterialPageRoute(builder: builder));
  }

  @override
  pop<T>() {
    navigatorKey.currentState?.pop();
  }

  @override
  popUntil(String route) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName('/'));
  }

  @override
  pushAll(List<Widget> pages) {
    for (var element in pages) {
      final WidgetBuilder builder = (_) => element;

      navigatorKey.currentState?.push(MaterialPageRoute(builder: builder));
    }
  }

  // Inicializando o app com deeplink no Navigator 1.0 bem complicado, essa é uma maneira básica, não é aconcelhavel utiliza-la.
  // Para o exemplo de deeplink, por favor utilizar o exemplo do "auto_route".
  void handleDeepLink(String? deeplink) async {
    if (deeplink != null) {
      int id = int.parse(deeplink);
      await Future.delayed(Duration(microseconds: 100));
      push(DetailPage(id: id));
    }
  }
}

abstract class NavHelperInterface {
  push<T>(Widget page);
  pushAll(List<Widget> pages);
  popUntil(String name);
  pop<T>();
}
