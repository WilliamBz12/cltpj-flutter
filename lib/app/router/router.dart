import 'package:auto_route/annotations.dart';
import 'package:pjorclt/app/pages/clt/clt_page.dart';
import 'package:pjorclt/app/pages/home/home_page.dart';
import 'package:pjorclt/app/pages/pj/pj_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: CltPage),
  AutoRoute(page: PjPage),
])
class $AppRouter {}
