import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:pjorclt/app/shared/models/clt_model.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/app_bar.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/custom_text_field_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider.dart';

class CltPage extends StatefulWidget {
  @override
  _CltPageState createState() => _CltPageState();
}

class _CltPageState extends State<CltPage> {
  final monthlyFixedSalary$ = TextEditingController();
  final monthlyVariableSalary$ = TextEditingController();
  final plrAnnual$ = TextEditingController();
  final diaryRefettionValue$ = TextEditingController();
  final medicalAssistenceValue$ = TextEditingController();
  final garageValue$ = TextEditingController();
  final foodValue$ = TextEditingController();
  final phoneValue$ = TextEditingController();
  final anotherBenefitsValue$ = TextEditingController();
  final anotherDiscounts$ = TextEditingController();

  double getValue(String text) {
    String withoutCaracters = text.replaceAll("R\$", "").replaceAll(",", "");
    double value = double.tryParse(withoutCaracters) ?? 0;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedAppBar("Dados CLT"),
            Expanded(
              child: CardResponsibleWidget(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildContent(),
                    ),
                    LoadingButtonWidget(
                      text: "Concluir",
                      color: AppColors.primary,
                      textColor: Colors.white,
                      onTap: () {
                        final data = CltModel(
                          anotherBenefitsValue:
                              getValue(anotherBenefitsValue$.text),
                          anotherDiscounts: getValue(anotherDiscounts$.text),
                          diaryRefettionValue:
                              getValue(diaryRefettionValue$.text),
                          foodValue: getValue(foodValue$.text),
                          garageValue: getValue(garageValue$.text),
                          medicalAssistenceValue:
                              getValue(medicalAssistenceValue$.text),
                          monthlyFixedSalary:
                              getValue(monthlyFixedSalary$.text),
                          monthlyVariableSalary:
                              getValue(monthlyVariableSalary$.text),
                          phoneValue: getValue(phoneValue$.text),
                          plrAnnual: getValue(plrAnnual$.text),
                        );

                        context
                            .read(dataComparationProvider.notifier)
                            .addCltModel(data);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            DefaultTextFieldWidget(
              controller: monthlyFixedSalary$,
              hintText: "Remuneração fixa mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: monthlyVariableSalary$,
              hintText: "Remuneração variável mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: plrAnnual$,
              hintText: "PLR anual (multiplos da remuneração fixa)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
            ),
            DefaultTextFieldWidget(
              controller: diaryRefettionValue$,
              hintText: "Valor diário de vale refeição",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: medicalAssistenceValue$,
              hintText: "Valor mensal da assistência médica",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: garageValue$,
              hintText: "Valor mensal de garagem",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: foodValue$,
              hintText: "Valor do VA (mensal)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherBenefitsValue$,
              hintText: "Valor mensal de outros benefícios",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherDiscounts$,
              hintText: "Valor mensal de outros gastos",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
          ],
        ),
      ),
    );
  }
}
