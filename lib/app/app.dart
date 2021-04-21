import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/router/router.gr.dart';
import 'package:pjorclt/app/shared/style/colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        builder: ExtendedNavigator.builder(
          router: AppRouter(),
          initialRoute: Routes.homePage,
          builder: (_, navigator) => Theme(
            data: ThemeData(
              primaryColor: AppColors.primary,
              scaffoldBackgroundColor: AppColors.primary,
            ),
            child: navigator,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
