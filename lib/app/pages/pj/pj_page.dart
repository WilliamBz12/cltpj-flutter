import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:pjorclt/app/shared/models/pj_model.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/app_bar.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/custom_text_field_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider.dart';

class PjPage extends StatefulWidget {
  final PjModel? pjModel;

  PjPage({@required this.pjModel});
  @override
  _PjPageState createState() => _PjPageState();
}

class _PjPageState extends State<PjPage> {
  final monthlyValue$ = TextEditingController();
  final vacationDaysPerYear$ = TextEditingController();
  final monthyBenefits$ = TextEditingController();
  final taxPercentage$ = TextEditingController();
  final expensesMontherAccountant$ = TextEditingController();
  final anotherYearExpenses$ = TextEditingController();
  final anotherMonthlyExpenses$ = TextEditingController();

  double getValue(String text) {
    final withoutCaractere =
        text.replaceAll("R\$", "").replaceAll(",", "").replaceAll("%", "");
    final data = double.tryParse(withoutCaractere) ?? 0;
    return data;
  }

  @override
  void initState() {
    super.initState();

    monthlyValue$.text = widget.pjModel?.monthlyValue.toString() ?? "";
    vacationDaysPerYear$.text =
        widget.pjModel?.vacationYearDays.toString() ?? "";
    monthyBenefits$.text = widget.pjModel?.monthyBenefits.toString() ?? "";
    taxPercentage$.text = widget.pjModel?.taxPercentage.toString() ?? "";
    expensesMontherAccountant$.text =
        widget.pjModel?.expensesMotnherAccountant.toString() ?? "";
    anotherYearExpenses$.text =
        widget.pjModel?.anotherYearExpenses.toString() ?? "";
    anotherMonthlyExpenses$.text =
        widget.pjModel?.anotherMonthExpenses.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedAppBar("Dados PJ"),
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
                        final data = PjModel(
                          anotherMonthExpenses:
                              getValue(anotherMonthlyExpenses$.text),
                          anotherYearExpenses:
                              getValue(anotherYearExpenses$.text),
                          expensesMotnherAccountant:
                              getValue(expensesMontherAccountant$.text),
                          monthlyValue: getValue(monthlyValue$.text),
                          monthyBenefits: getValue(monthyBenefits$.text),
                          taxPercentage: getValue(taxPercentage$.text),
                          vacationYearDays: getValue(vacationDaysPerYear$.text),
                          vacationPaid: true,
                        );
                        context
                            .read(dataComparationProvider.notifier)
                            .addPjModel(data);

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
              controller: monthlyValue$,
              hintText: "Remuneração fixa mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: vacationDaysPerYear$,
              hintText: "Dias de férias por ano",
              prefixIcon: Icon(Icons.hourglass_empty_sharp),
              keyboardType: TextInputType.number,
            ),
            DefaultTextFieldWidget(
              controller: monthyBenefits$,
              hintText: "Valor dos beneficios Mensais",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: taxPercentage$,
              hintText: "Percentual de imposto pago",
              prefixIcon: Icon(Icons.domain_verification_outlined),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "% ")],
            ),
            DefaultTextFieldWidget(
              controller: expensesMontherAccountant$,
              hintText: "Gastos Mensais com o contador",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherMonthlyExpenses$,
              hintText:
                  "Outras despesas mensais (INSS, Plano de saúde, Previdência, ...)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherYearExpenses$,
              hintText: "Outras despesas anuais",
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
