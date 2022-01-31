import 'package:auto_route/auto_route.dart';
import 'package:flutter_routes_poc/pages/colors_page/blue_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/green_page.dart';
import 'package:flutter_routes_poc/pages/colors_page/red_page.dart';
import 'package:flutter_routes_poc/pages/detail_page.dart';
import 'package:flutter_routes_poc/pages/home_page.dart';

// Para geração de código, é necessário instanciar a classe "AutoRoute" com seguintes parametros:
// "path": não é obrigatório, mas é recomendado setar um valor, senão o próprio pacote cria um path para cada route
// "page": apenas o Type da screen, valor obrigatório
// "initial": setar qual é a página inicial.

// Para esse pacote é necessário a geração de código, segue o comando:
// flutter packages pub run build_runner build
// ou
// flutter packages pub run build_runner watch

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
