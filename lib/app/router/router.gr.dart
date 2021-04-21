// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../pages/clt/clt_page.dart';
import '../pages/home/home_page.dart';
import '../pages/pj/pj_page.dart';
import '../shared/models/pj_model.dart';

class Routes {
  static const String homePage = '/';
  static const String cltPage = '/clt-page';
  static const String pjPage = '/pj-page';
  static const all = <String>{
    homePage,
    cltPage,
    pjPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.cltPage, page: CltPage),
    RouteDef(Routes.pjPage, page: PjPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    CltPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CltPage(),
        settings: data,
      );
    },
    PjPage: (data) {
      final args = data.getArgs<PjPageArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PjPage(pjModel: args.pjModel),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PjPage arguments holder class
class PjPageArguments {
  final PjModel pjModel;
  PjPageArguments({@required this.pjModel});
}
