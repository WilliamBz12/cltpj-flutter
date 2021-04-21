import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/router/router.gr.dart';
import 'package:pjorclt/app/shared/notifiers/comparation_state.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

import '../../provider.dart';
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
          ProviderListener<ComparationState>(
            provider: comparationNotifierProvider.state,
            onChange: (context, state) {
              if (state is ComparationError) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(state.message),
                  ),
                );
              }

              if (state is ComparationLoaded) {
                ExtendedNavigator.root.push(
                  Routes.cltPage,
                  arguments: state.comparation,
                );
              }
            },
            child: Consumer(
              builder: (context, watch, child) {
                final state = watch(comparationNotifierProvider.state);
                return LoadingButtonWidget(
                  onTap: () {
                    context
                        .read(comparationNotifierProvider)
                        .getComparation(null, null);
                  },
                  isLoading: state is ComparationLoading,
                  text: "Calcular",
                  color: AppColors.success,
                  textColor: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
