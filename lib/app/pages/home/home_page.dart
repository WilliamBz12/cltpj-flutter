import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/router/router.gr.dart';
import 'package:pjorclt/app/shared/notifiers/comparation/comparation_state.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';
import 'package:auto_route/auto_route.dart';

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
      child: Consumer(
        builder: (context, watch, child) {
          final dataComparation = watch(dataComparationProvider);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardWidget(
                title: "Dados CLT",
                clear: () {
                  context
                      .read(dataComparationProvider.notifier)
                      .addCltModel(null);
                },
                onTap: () async {
                  context.router.root.push(CltPageRoute());
                },
                checked: dataComparation.cltModel != null,
              ),
              SizedBox(height: 20),
              CardWidget(
                clear: () {
                  context
                      .read(dataComparationProvider.notifier)
                      .addPjModel(null);
                },
                onTap: () async {
                  context.router.root.push(
                    PjPageRoute(pjModel: dataComparation.pjModel),
                  );
                },
                title: "Dados PJ",
                checked: dataComparation.pjModel != null,
              ),
              SizedBox(height: 20),
              ProviderListener<ComparationState>(
                provider: comparationNotifierProvider,
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
                    context.router.root.push(
                      ResultPageRoute(data: state.comparation),
                    );
                  }
                },
                child: Consumer(
                  builder: (context, watch, child) {
                    final state = watch(comparationNotifierProvider);
                    return LoadingButtonWidget(
                      onTap: () {
                        context
                            .read(comparationNotifierProvider.notifier)
                            .getComparation(dataComparation);
                      },
                      isLoading: state is ComparationLoading,
                      text: "Comparar",
                      color: AppColors.danger,
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
