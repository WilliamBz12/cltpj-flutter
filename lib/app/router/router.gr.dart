// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:pjorclt/app/pages/clt/clt_page.dart' as _i3;
import 'package:pjorclt/app/pages/home/home_page.dart' as _i2;
import 'package:pjorclt/app/pages/pj/pj_page.dart' as _i4;
import 'package:pjorclt/app/pages/result/result_page.dart' as _i5;
import 'package:pjorclt/app/shared/models/comparation_model.dart' as _i7;
import 'package:pjorclt/app/shared/models/pj_model.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomePage());
    },
    CltPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.CltPage());
    },
    PjPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<PjPageRouteArgs>(orElse: () => PjPageRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i4.PjPage(pjModel: args.pjModel));
    },
    ResultPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<ResultPageRouteArgs>();
      return _i1.AdaptivePage(
          entry: entry, child: _i5.ResultPage(data: args.data));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(CltPageRoute.name, path: '/clt-page'),
        _i1.RouteConfig(PjPageRoute.name, path: '/pj-page'),
        _i1.RouteConfig(ResultPageRoute.name, path: '/result-page')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class CltPageRoute extends _i1.PageRouteInfo {
  const CltPageRoute() : super(name, path: '/clt-page');

  static const String name = 'CltPageRoute';
}

class PjPageRoute extends _i1.PageRouteInfo<PjPageRouteArgs> {
  PjPageRoute({_i6.PjModel? pjModel})
      : super(name, path: '/pj-page', args: PjPageRouteArgs(pjModel: pjModel));

  static const String name = 'PjPageRoute';
}

class PjPageRouteArgs {
  const PjPageRouteArgs({this.pjModel});

  final _i6.PjModel? pjModel;
}

class ResultPageRoute extends _i1.PageRouteInfo<ResultPageRouteArgs> {
  ResultPageRoute({required _i7.ComparationModel data})
      : super(name,
            path: '/result-page', args: ResultPageRouteArgs(data: data));

  static const String name = 'ResultPageRoute';
}

class ResultPageRouteArgs {
  const ResultPageRouteArgs({required this.data});

  final _i7.ComparationModel data;
}
