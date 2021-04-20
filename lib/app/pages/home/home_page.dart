import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pjorclt/app/router/router.gr.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

import 'widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return CardResponsibleWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CardWidget(
            title: "Dados CLT",
            onTap: () {
              ExtendedNavigator.root.push(Routes.cltPage);
            },
            checked: false,
          ),
          SizedBox(height: 20),
          CardWidget(
            onTap: () {
              ExtendedNavigator.root.push(Routes.pjPage);
            },
            title: "Dados PJ",
            checked: false,
          ),
          SizedBox(height: 20),
          LoadingButtonWidget(
            onTap: () {
              ExtendedNavigator.root.push(Routes.pjPage);
            },
            text: "Calcular",
            color: AppColors.success,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
