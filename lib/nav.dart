import 'package:auto_route/auto_route.dart';
import 'package:flutter_routes_poc/routes.gr.dart';

NavHelper navHelper = NavHelper(appRouter: AppRouter());

class NavHelper implements NavHelperInterface {
  late AppRouter appRouter;

  NavHelper({
    required this.appRouter,
  });

  // PageRouteInfo é um tipo de classe do pacote, toda a vez que gera o código o pacote cria um PageRouteInfo para cada rota;
  // Para a "DetailPage" é criado um "DetailRouteInfo", para navagedar da HomePage para a página de Detalhe é necessário passar o DetailRouteInfo como parametro.
  @override
  push<T>(PageRouteInfo route) {
    appRouter.push<T>(route);
  }

  // Para dar push em uma pilha de páginas, segue a mesma ideia do push porém passando uma lista PageRouteInfo.
  @override
  pushAll(List<PageRouteInfo> routes) {
    appRouter.pushAll(routes);
  }

  // Quando há uma pilha de telas e você quer retorna para alguma que esteja no meio da pilha, é necessário passar o name da página.
  // Para acessar o nome da página corretamente, há um getter em cada PageRouteInfo, por exemplo na página de detalhe é acessar a váriavel DetailPageRoute.name
  @override
  popUntil(String name) {
    appRouter.popUntilRouteWithName(name);
  }

  // O pop é simples, é só chamar o método.
  // Para retornos de valores é interessante pesquisar no link do pacote como se faz.
  @override
  pop<T>() {
    appRouter.pop<T>();
  }
}

abstract class NavHelperInterface {
  push<T>(PageRouteInfo route);
  pushAll(List<PageRouteInfo> routes);
  popUntil(String name);
  pop<T>();
}
